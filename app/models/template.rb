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

  def self.generate(value)
    template_file = "#{Rails.root}/templates/hello-world.docx"
    tmpdir=Dir.mktmpdir("generate")
    Rails.logger.info "TEMPLATE: Unzipping word doc '#{template_file}' into '#{tmpdir}'"
    unzip_file template_file, tmpdir
    #`unzip "#{template_file}" -d "#{tmpdir}"`
    Rails.logger.info "TEMPLATE: reading '#{tmpdir}/word/document.xml'"
    contents = File.read("#{tmpdir}/word/document.xml")
    Rails.logger.info "TEMPLATE: read #{contents.size} bytes from '#{tmpdir}/word/document.xml'"
    Rails.logger.info "TEMPLATE: setting VARIABLE_NAME to '#{value}'"
    contents = contents.gsub(/VARIABLE_NAME/, value)
    Rails.logger.info "TEMPLATE: writing #{contents.size} bytes into '#{tmpdir}/word/document.xml'"
    File.write("#{tmpdir}/word/document.xml", contents)
    output_file = "#{tmpdir}/output.docx"
    Rails.logger.info "TEMPLATE: creating '#{output_file}'"
    zip_dir output_file, tmpdir
    #`cd "#{tmpdir}"; zip -r output.docx *`
    Rails.logger.info "TEMPLATE: returning '#{output_file}'"
    return "#{tmpdir}/output.docx"
  end
end
