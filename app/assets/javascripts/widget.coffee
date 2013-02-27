class EasyEval.Widget
  ID = 479889 # "aaaa" - 1
  ALL=@ALL=[]

  TAGS=@TAGS={}

  @ROOT_VIEW = new class EasyEval.RootView extends @
    getValue: -> undefined
    getName: -> null

  @wireup: ->
    @ROOT_VIEW.wireup(document.body)

  wireup: (node)->
    for n in node.childNodes
      if view_class = TAGS[n.tagName]
        @addChild(new view_class(n)).wireup(n)
      else
        @wireup(n)
    return @

  @register: (tag_name) ->
    TAGS[tag_name.toUpperCase()] = @

  @getJson: ->
    @ROOT_VIEW.getJson(null)
  getJson: (prefix=null, json={}) ->
    if name = @getName()
      if prefix != null
        prefix += "_#{name}"
      else
        prefix = name
    if typeof (value = @getValue()) != 'undefined'
      console.log "Looking at #{@constructor.name}, prefix=#{prefix}, value=#{value}"
      if json[prefix]
        console.log "WARNING: json[#{prefix}] is already defined as #{json[prefix]}"
      json[prefix] = value
    if @children
      for c in @children
        c.getJson(prefix, json)
    json


  addChild: (child) ->
    (@children ||= []).push(child)
    return child


  constructor: (node) ->
    return unless node
    ALL.push @
    node.view = @
    @node = $(node)
    @guid = (++ID).toString(36)

  getValue: ->
    raise 'Must be defined'
  getName: ->
    @node.attr('name')
