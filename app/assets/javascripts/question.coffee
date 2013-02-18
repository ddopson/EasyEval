class EasyEval.Question extends EasyEval.Widget
  @register 'Question'

  constructor: (node) ->
    super
    if title = @node.attr('text')
      @node.prepend """<question_text>#{title}</question_text>"""

  getValue: ->
    undefined

