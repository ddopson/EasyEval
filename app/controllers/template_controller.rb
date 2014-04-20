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
    return if File.read(path) == contents
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

    ['_doc.slim', '_Q16-illness.slim', 'logic.rb'].each do |file|
      contents = params[file]
        raise "#{file} is REALLY short. only #{contents.length} chars" unless contents.length > 200
        if file == 'logic.rb'
          full_file = "#{Rails.root}/app/models/#{file}"
        else
          full_file = "#{Rails.root}/app/views/template/#{file}"
        end
        write_file_and_symlink full_file, contents.gsub(/\r\n/, "\n")
    end
    redirect_to '/template'
  end

  def generate
    @json_data = params[:json_data]
    write_file_and_symlink "#{Rails.root}/data/data.json", @json_data
  end

  def generate2
    p = JSON.parse(params[:json_data])
    p = Logic.process(p)
    @json_data = JSON.pretty_generate(p)
  end

  def generate_docx
    pms = JSON.parse(params[:json_data])
    output_file = Template.generate("real.docx", pms)
    send_file output_file, type: "application/msword"
  end

end
