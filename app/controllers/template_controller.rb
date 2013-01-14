class TemplateController < ApplicationController
  def index
  end

  def editor
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
