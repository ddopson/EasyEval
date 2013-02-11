class EasyEval.CheckboxSet
  @ALL: []

  @initialize: ($$) ->
    for node in $$('CheckboxSet')
      @ALL.push new @(node, 'checkbox')
    for node in $$('RadioSet')
      @ALL.push new @(node, 'radio')

  constructor: (node, type) ->
    @node = $(node)
    @type = type
    @values = []
    @name = @node.attr('name') or raise "Must supply 'name' for this node"
    for n in @node.find('value')
      @values.push(n.textContent)
   
    content = ''
    #content += """ ijc input(type="hidden", name="#{@name}") """
    for value in @values
      content += """ !ijc
        label(class=@type)
          INPUT(type=@type, name=@name, value="#{value}")= "#{value}"
        """

    @node.append(content)
  
  english_join: (values) ->
    switch values.length
      when 0 then ""
      when 1 then values[0]
      when 2 then "#{values[0]} and #{values[1]}"
      else "#{values[0..-2].join(', ')}, and #{values[-1..]}"


  process_checkbox: (checkbox, evt) ->
    return unless $(checkbox).parent().is('question')
    valuesbox = $(checkbox).parent().find('.checkbox_values')
    return unless valuesbox.length == 1
    checkboxes = $(checkbox).parent().find('.checkbox')
    values = []
    for c in checkboxes
      if c.firstChild.checked
        if $(c).is('.checkbox_other')
          pre = $(c.firstChild).attr('prepend')
          if pre == 'prepend'
            pre = c.textContent
          if pre
            pre += " "
          pre ||= ''
          console.log "PREPEND='#{pre}'"
          txt = $(c).find('.other_textbox').val()
          values.push("#{pre}#{txt}")
        else
          values.push(c.textContent)
    joined = @english_join(values)
    valuesbox.val(joined)
    console.log "Setting #{valuesbox.attr('name')} to #{joined}"


  process_checkbox_other: (checkbox, evt) ->
    o = $(checkbox).find('.other_textbox')
    if o.length == 0
      $(checkbox).append """ !ijc input.input-medium.other_textbox(type="text", placeholder="") """
      o = $(checkbox).find('.other_textbox')

      # Need to disable clicks so that clicking the text-box won't uncheck the 'other' checkbox
      o.click (evt) -> evt.preventDefault()


    if checkbox.firstChild.checked
      o.show()
      o.focus()
    else
      o.hide()


  process_checkbox_enabler: (checkbox, evt) ->
    if $(checkbox.firstChild).attr('type') == 'radio'
      radios = $(checkbox).parents('question').find('input[type="radio"]')
      selectors = [].join.call(radios.map((idx, node) -> $(node).attr('data-selector')), ',')
      console.log "Disabling #{selectors}"
      $(selectors).hide()
    sel = $(checkbox.firstChild).attr('data-selector')
    if checkbox.firstChild.checked
      console.log "Enabling #{sel}"
      $(sel).show()
    else
      console.log "Disabling #{sel}"
      $(sel).hide()

