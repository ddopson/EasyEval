class EasyEval.Table
  TABLES = @TABLES = []
  @initialize: ->
    $('table').each (idx, node) ->
      return unless $(node).find('.table-row-model').length > 0
      TABLES.push new Table(node)
      
  constructor: (node) ->
    @$node = $(node)
    console.log "Making table for ", node, @$node.find('.table-new-row')
    model = @$node.find('.table-row-model')
    model.removeClass('table-row-model')
    @html = model[0].outerHTML
    
    @$node.find('.table-new-row').on 'click', => @newRow()
    #@newRow()

  newRow: () ->
    console.log "New Row"
    @html ||= @$node.find('.table-row-model')[0].outerHTML
    @$node.find('tr').last().before(@html)
    
    rows = @$node.find('tr')
    new_row = rows[rows.length - 2]
    $(new_row).removeClass('table-row-model')
    EasyEval.TemplateHelpers.init(new_row)
      
