class window.TemplateHelpers
  @initialize: () ->
    self = new TemplateHelpers()
    $('.checkbox').on 'change', (evt) -> self.process_checkbox(@, evt)

  process_checkbox: (checkbox, evt) ->
    return unless $(checkbox).parent().is('question')
    valuesbox = $(checkbox).parent().find('.checkbox_values')
    return unless valuesbox.length == 1
    checkboxes = $(checkbox).parent().find('.checkbox')
    values = []
    for c in checkboxes
      if c.firstChild.checked
        values.push(c.textContent)
    valuesbox.val(values.join(', '))
    console.log "Setting #{valuesbox.attr('name')} to #{values.join(', ')}"
      

  
      
