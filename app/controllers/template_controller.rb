class TemplateController < ApplicationController
  def index
  end

  def editor
  end

  def json
    render :json => params
  end

  def generate
    output_file = Template.generate("real.docx", params[:value])
    send_file output_file, type: "application/msword"
  end
end
