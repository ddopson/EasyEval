class EasyEval.CheckboxRollup
  @initialize: () ->
    self = new @()
    $('.checkbox').on 'change', (evt) -> self.process_checkbox(@, evt)

    $('.checkbox_other').on 'change', (evt) -> self.process_checkbox_other(@, evt)

    $('.checkbox_enabler').on 'change', (evt) -> self.process_checkbox_enabler(@, evt)
    $('.checkbox_enabler').each (idx, checkbox) -> self.process_checkbox_enabler(checkbox, null)
    $('question').each (idx, qnode) ->
      if name = $(qnode).attr('name')
        console.log "Adding hidden input for '#{name}'"
        $(qnode).append """ !ijc
          input.checkbox_values(type="hidden", name="#{name}")
        """

  english_join: (values) ->
    switch(values.length)
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
      $(checkbox).append """
        !ijc input.input-medium.other_textbox(type="text", placeholder="")
      """
      o = $(checkbox).find('.other_textbox')

      # Need to disable clicks so that clicking the text-box won't uncheck the 'other' checkbox
      o.click (evt) -> evt.preventDefault()


    if checkbox.firstChild.checked
      o.show()
      o.focus()
    else
      o.hide()


  process_checkbox_enabler: (checkbox, evt) ->
    sel = $(checkbox.firstChild).attr('data-selector')
    if checkbox.firstChild.checked
      $(sel).show()
    else
      $(sel).hide()

