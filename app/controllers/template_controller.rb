class TemplateController < ApplicationController
  def index
  end

  def editor
  end

  def generate
    options = {}
    output_file = Template.generate(params[:value])
    send_file output_file, type: "application/msword"
  end
end
