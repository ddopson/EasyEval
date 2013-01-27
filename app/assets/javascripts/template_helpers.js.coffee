class window.TemplateHelpers
  @initialize: () ->
    self = new TemplateHelpers()
    $('.checkbox').on 'change', (evt) -> self.process_checkbox(@, evt)

    $('.checkbox_other').on 'change', (evt) -> self.process_checkbox_other(@, evt)

    $('.checkbox_enabler').on 'change', (evt) -> self.process_checkbox_enabler(@, evt)
    $('.checkbox_enabler').each (idx, checkbox) -> self.process_checkbox_enabler(checkbox, null)
    EasyEval.Autocomplete.initialize()

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
    valuesbox.val(values.join(', '))
    console.log "Setting #{valuesbox.attr('name')} to #{values.join(', ')}"


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

