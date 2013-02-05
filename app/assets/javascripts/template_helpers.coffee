class EasyEval.TemplateHelpers
  @initialize: (node = document.body) ->
    start = Date.now()
    EasyEval.Table.initialize()
    @init(document.body)
    #EasyEval.Autocomplete.initialize()
    EasyEval.CheckboxRollup.initialize()
    EasyEval.TableOfContents.initialize($)
    duration = (Date.now() - start)
    console.log "Completed Initialization in #{duration} ms"

  @init: (node) ->
    $node = $(node)
    $$ = $node.find.bind($node)
    window.thenode = node
    window.dd = $$
    EasyEval.Autocomplete.initialize($$)

