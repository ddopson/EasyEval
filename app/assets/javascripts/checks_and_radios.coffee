class EasyEval.CheckboxSet extends EasyEval.Widget
  @ALL: []

  @initialize: ($$) ->
    for node in $$('CheckboxSet')
      @ALL.push new @(node, 'checkbox')
    for node in $$('RadioSet')
      @ALL.push new @(node, 'radio')

  constructor: (node, type) ->
    super
    @type = type
    @values = []
    content = ''
    for n in @node.find('Value,ValueOther')
      value = n.textContent
      classes = ''
      if $(n).is('ValueOther')
        content += """ !ijc
          label(class=@type)
            INPUT.checkbox_other(type=@type, name=@guid, prepend=$(n).attr('prepend'))= "#{value}"
            //INPUT.input-medium.other_textbox(type="text", placeholder="")
          """
      else
        content += """ !ijc
          label(class=@type)
            INPUT(type=@type, name=@guid)= "#{value}"
          """

    @node.append(content)
    self = @
    @node.find('.checkbox_other').on 'change', (evt) -> self.process_checkbox_other(@, evt)

  getJson: ->
    values = []
    for checkbox in @node.find('INPUT')
      if checkbox.checked
        $c = $(checkbox)
        if $c.hasClass('checkbox_other')
          pre = $c.attr('prepend')
          if pre == 'prepend'
            # if prepend is set to 'true' then use the text content as the prepend string
            pre = c.textContent
          if pre
            pre += " "
          pre ||= ''
          console.log "PREPEND='#{pre}'"
          txt = $c.parent().find('.other_textbox').val()
          values.push("#{pre}#{txt}")
        else
          values.push checkbox.textContent
    return @english_join(values)

  english_join: (values) ->
    switch values.length
      when 0 then ""
      when 1 then values[0]
      when 2 then "#{values[0]} and #{values[1]}"
      else "#{values[0..-2].join(', ')}, and #{values[-1..]}"

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



