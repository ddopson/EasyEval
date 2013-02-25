class EasyEval.Autocomplete extends EasyEval.Widget
  @register 'Autocomplete'

  constructor: (node) ->
    super
    content = """ !ijc
      select
        -for v in EEData.Autocomplete['meds']
          option(value=v)= v
    """
    @node.append(content)
    @input = @node.find('select')
    @input.combobox()


  getValue: ->
    @input.val()
