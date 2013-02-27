class EasyEval.Table extends EasyEval.Widget
  @register 'Table'

  class Row extends EasyEval.Widget
    getValue: -> undefined

  constructor: (node) ->
    super
    model = @node.find('.table-row-model')
    return if model.length == 0
    console.log "Making table for ", node, @node.find('.table-new-row')
    model.removeClass('table-row-model')
    @html = model[0].outerHTML
    @model_node = model[0]
    @rows = []
    @node.find('.table-new-row').on 'click', => @newRow()

  wireup: (node) ->
    unless node == @model_node
      return super
    @rows.push new Row(node).wireup(node)
    return @

  newRow: () ->
    console.log "New Row"
    @node.find('tr').last().before(@html)

    rows = @node.find('tr')
    new_row = rows[rows.length - 2]
    $(new_row).removeClass('table-row-model')
    @rows.push new Row(new_row).wireup(new_row)

  getValue: ->
    return undefined unless @rows
    row.getJson() for row in @rows
