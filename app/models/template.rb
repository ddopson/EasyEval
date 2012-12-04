class Template
  def self.generate(value)
    template_file = "#{Rails.root}/templates/hello-world.docx"
    tmpdir=Dir.mktmpdir("generate")
    Rails.logger.info "TEMPLATE: Unzipping word doc '#{template_file}' into '#{tmpdir}'"
    `unzip "#{template_file}" -d "#{tmpdir}"`
    Rails.logger.info "TEMPLATE: reading '#{tmpdir}/word/document.xml'"
    contents = File.read("#{tmpdir}/word/document.xml")
    Rails.logger.info "TEMPLATE: read #{contents.size} bytes from '#{tmpdir}/word/document.xml'"
    Rails.logger.info "TEMPLATE: setting VARIABLE_NAME to '#{value}'"
    contents = contents.gsub(/VARIABLE_NAME/, value)
    Rails.logger.info "TEMPLATE: writing #{contents.size} bytes into '#{tmpdir}/word/document.xml'"
    File.write("#{tmpdir}/word/document.xml", contents)
    Rails.logger.info "TEMPLATE: creating '#{tmpdir}/output.docx'"
    `cd "#{tmpdir}"; zip -r output.docx *`
    Rails.logger.info "TEMPLATE: returning '#{tmpdir}/output.docx'"
    return "#{tmpdir}/output.docx"
  end
end
