require 'inline_template_preprocessor'
Rails.application.assets.register_preprocessor('application/javascript', InlineTemplatePreprocessor)
