class EasyEval.CheckboxSet extends EasyEval.Widget
  @register 'CheckboxSet'
  @register 'RadioSet'

  constructor: (node) ->
    super
    @rollup = @node.attr('rollup') || 'join'
    @type = if @node[0].tagName == 'CHECKBOXSET' then 'checkbox' else 'radio'
    @values = []
    content = ''
    for n in @node.find('Value,ValueOther')
      value = n.textContent
      if sel = $(n).attr('enables-selector')
        $(sel).hide()

      realValue = $(n).attr('value') ? value
      if $(n).is('ValueOther')
        content += """ !ijc
          label(class=@type)
            INPUT.other(type=@type, name=@guid, prepend=$(n).hasClass('prepend'), data-selector=sel, value=realValue)= "#{value}"
          """
      else
        content += """ !ijc
          label(class=@type)
            INPUT(type=@type, name=@guid, data-selector=sel, value=realValue)= "#{value}"
          """

    @node.append(content)
    self = @
    @node.find('INPUT.other').on 'change', (evt) -> self.process_checkbox_other(@, evt)
    @node.find('INPUT').on 'change', (evt) -> self.process_change(@, evt)

  getValue: ->
    values = []
    for checkbox in @node.find('INPUT')
      continue unless checkbox.checked
      $c = $(checkbox)
      if $c.hasClass('other')
        pre = $c.attr('prepend')
        if pre == 'prepend'
          # if prepend is set to 'true' then use the text content as the prepend string
          pre = checkbox.parentElement.textContent
        if pre
          pre += " "
        pre ||= ''
        console.log "PREPEND='#{pre}'"
        txt = $c.parent().find('.other_textbox').val()
        console.log "TXT=#{txt}", $c
        values.push("#{pre}#{txt}")
      else
        values.push $(checkbox).attr('value')

    switch @rollup
      when 'join' then return @english_join(values)
      when 'sum' then return values.length

  english_join: (values) ->
    switch values.length
      when 0 then ""
      when 1 then values[0]
      when 2 then "#{values[0]} and #{values[1]}"
      else "#{values[0..-2].join(', ')}, and #{values[-1..]}"

  process_checkbox_other: (checkbox, evt) ->
    $parent = $(checkbox).parent()
    o = $parent.find('.other_textbox')
    if o.length == 0
      $parent.append """ !ijc input.input-medium.other_textbox(type="text", placeholder="") """
      o = $parent.find('.other_textbox')

      # Need to disable clicks so that clicking the text-box won't uncheck the 'other' checkbox
      o.click (evt) -> evt.preventDefault()

    if checkbox.checked
      o.show()
      o.focus()
    else
      o.hide()

  process_change: (checkbox, evt) ->
    if @type == 'radio'
      # Radio buttons don't emit 'changed' for the previous selection.
      # This provides behavioral parity with checkboxes
      if last=@last
        @last = null
        $(last).trigger 'change'
      @last = checkbox

    if sel = $(checkbox).attr('data-selector')
      if checkbox.checked
        console.log "Enabling #{sel}"
        $(sel).show()
      else
        console.log "Disabling #{sel}"
        $(sel).hide()

