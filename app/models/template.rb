require 'zip/zip'

class Template
  def self.unzip_file(zipfile, dest)
    Zip::ZipFile.open(zipfile) { |entries|
      entries.each { |f|
        f_path = File.join(dest, f.name)
        FileUtils.mkdir_p(File.dirname(f_path))
        entries.extract(f, f_path)
      }
    }
  end

  def self.zip_dir(zipfile, dir)
    Zip::ZipFile.open(zipfile, Zip::ZipFile::CREATE) do |entries|
      input_filenames = Dir.glob("#{dir}/**/*", File::FNM_DOTMATCH).reject {|fn| File.directory?(fn) }
      input_filenames.each do |filename|
        entryname = filename.gsub("#{dir}/", '')
        Rails.logger.info "TEMPLATE: Adding '#{entryname}' to zipfile"
        entries.add(entryname, filename)
      end
    end
  end

  def self.write_file(filename, contents)
    # Heroku doesn't support File.write.  boooooooo!
    f = File.open(filename, 'w')
    f.write(contents)
    f.close
  end

  def self.generate(template_file, params)
    unless template_file.match(/^\//)
      template_file = "#{Rails.root}/templates/#{template_file}"
    end
    tmpdir=Dir.mktmpdir("generate")
    Rails.logger.info "TEMPLATE: Unzipping word doc '#{template_file}' into '#{tmpdir}'"
    unzip_file template_file, tmpdir
    #`unzip "#{template_file}" -d "#{tmpdir}"`
    Rails.logger.info "TEMPLATE: reading '#{tmpdir}/word/document.xml'"
    contents = File.read("#{tmpdir}/word/document.xml")
    Rails.logger.info "TEMPLATE: read #{contents.size} bytes from '#{tmpdir}/word/document.xml'"

    contents.gsub!(/<w:tr.*?<\/w:tr>/) do |m|
      m.gsub!(/ROWFILLIN_([A-Z0-9_]+)/) do |mm|
        mm
      end
    end

    contents.gsub!(/FILLIN_([A-Z0-9_]+)/) do |m|
      key = $1
      if value = params[key]
        Rails.logger.info "Replacing '#{m}' with '#{value}'"
        value
      else
        Rails.logger.warn "No value defined for #{m}"
        "UNDEFINED(#{key})"
      end
    end
    Rails.logger.info "TEMPLATE: writing #{contents.size} bytes into '#{tmpdir}/word/document.xml'"
    write_file("#{tmpdir}/word/document.xml", contents)
    output_file = "#{tmpdir}/output.docx"
    Rails.logger.info "TEMPLATE: creating '#{output_file}'"
    zip_dir output_file, tmpdir
    #`cd "#{tmpdir}"; zip -r output.docx *`
    Rails.logger.info "TEMPLATE: returning '#{output_file}'"
    return "#{tmpdir}/output.docx"
  end
end
