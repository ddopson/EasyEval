class EasyEval.TemplateHelpers
  @initialize: (node = document.body) ->
    start = Date.now()
    EasyEval.Widget.wireup()
    EasyEval.TableOfContents.initialize($)
    duration = (Date.now() - start)
    console.log "Completed Initialization in #{duration} ms"

