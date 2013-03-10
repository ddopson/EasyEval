class TemplateController < ApplicationController
  def index
  end

  def editor
  end

  def micaela
    raise "Forbidden" unless Rails.env.development?
  end

  def micaela_docx
    send_file("#{Rails.root}/templates/real.docx",
      filename:      'output_template.docx',
      type:          'application/msword',
      disposition:   'attachment',
    )
  end

  def write_file_and_symlink(path, contents)
    i = Time.now.to_i
    File.open("#{path}.#{i}", 'wb'){|file| file.write(contents) }
    FileUtils.rm(path)
    File.open(path, 'wb'){|file| file.write(contents) }
    #    if File.symlink?(path)
    #      FileUtils.rm(path)
    #    else
    #      FileUtils.mv(path, "#{path}.bak.#{i}")
    #    end
    #    File.symlink("#{path}.#{i}", path)
  end

  def micaela_submit
    raise "Forbidden" unless Rails.env.development?

    if contents = params['output_template.docx']
      contents.tempfile.binmode
      write_file_and_symlink "#{Rails.root}/templates/real.docx", contents.read
    end

    ['_doc.slim', '_Q16-illness.slim'].each do |file|
      contents = params[file]
        raise "#{file} is REALLY short. only #{contents.length} chars" unless contents.length > 200
        write_file_and_symlink "#{Rails.root}/app/views/template/#{file}", contents.gsub(/\r\n/, "\n")
    end
    redirect_to '/template'
  end

  def generate
    @json_data = params[:json_data]
  end

  def generate_docx
    output_file = Template.generate("real.docx", JSON.parse(params[:json_data]))
    send_file output_file, type: "application/msword"
  end

end
