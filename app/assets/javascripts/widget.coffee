class EasyEval.Widget
  ID = 479889 # "aaaa" - 1
  constructor: (node) ->
    @node = $(node)
    names = []
    for p in @node.parents('[name]')
      names.push $(p).attr('name')
    if @node.attr('name')
      names.push @node.attr('name')
    if names.length == 0
      raise "Must supply 'name' for this node"
    @name = names.join('_')
    @guid = (++ID).toString(36)
    node.view = $

  getJson: ->
    raise 'Must be defined'
