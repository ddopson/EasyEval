class Demo1Controller < ApplicationController
  def index
  end

  def generate
    options = {}
    output_file = Template.generate("hello-world.docx", {"VARIABLE_NAME" => params[:value]})
    send_file output_file, type: "application/msword"
  end
end
