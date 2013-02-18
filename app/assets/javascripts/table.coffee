class EasyEval.Table extends EasyEval.Widget
  @register 'Table'

  constructor: (node) ->
    super
    model = @node.find('.table-row-model')
    return if model.length == 0
    console.log "Making table for ", node, @node.find('.table-new-row')
    model.removeClass('table-row-model')
    @html = model[0].outerHTML

    @node.find('.table-new-row').on 'click', => @newRow()

  newRow: () ->
    console.log "New Row"
    @node.find('tr').last().before(@html)

    rows = @node.find('tr')
    new_row = rows[rows.length - 2]
    $(new_row).removeClass('table-row-model')
    EasyEval.TemplateHelpers.init(new_row)
    EasyEval.Widget._wireup(new_row, @)

  getValue: ->
    undefined

