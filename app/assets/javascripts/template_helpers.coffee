class EasyEval.TemplateHelpers
  @initialize: () ->
    start = Date.now()
    EasyEval.Autocomplete.initialize()
    EasyEval.CheckboxRollup.initialize()
    EasyEval.TableOfContents.initialize()
    duration = (Date.now() - start)
    console.log "Completed Initialization in #{duration} ms"
