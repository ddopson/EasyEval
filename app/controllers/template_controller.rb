class TemplateController < ApplicationController
  def index
  end

  def editor
  end

  def micaela
    raise "Forbidden" unless Rails.env.development?
  end

  def micaela_submit
    raise "Forbidden" unless Rails.env.development?
    ['_doc.slim', '_Q16-illness.slim'].each do |file|
    txt = params[file]
      unless txt.length > 200
        raise "#{file} is REALLY short. only #{txt.length} chars"
      end
      i = Time.now.to_i
      path = "#{Rails.root}/app/views/template/#{file}"
      File.write("#{path}.#{i}", txt.gsub(/\r\n/, "\n"))
      if File.symlink?(path)
        FileUtils.rm(path)
      else
        FileUtils.mv(path, "#{path}.bak.#{i}")
      end
      File.symlink("#{path}.#{i}", path)
    end
    redirect_to '/template'
  end

  def generate
    if params[:JSON_ONLY]
      render :json => params
    else
      output_file = Template.generate("real.docx", params)
      send_file output_file, type: "application/msword"
    end
  end
end
