class EasyEval.TextBox extends EasyEval.Widget
  @register 'TextBox'

  constructor: (node) ->
    super
    @node.append """ !ijc
       input.input-medium(type="text")
    """
    @input = @node.find('input')
    if name = @node.attr('name')
      @input.attr('name', name)

  getValue: ->
    @input.val()

