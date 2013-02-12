class EasyEval.Autocomplete
  @initialize: ($$) ->
    console.log "Autocomplete init for ", $$('.autocomplete-meds')

    content = ""
    for v in EEData.Autocomplete['meds']
      content += """<option value="#{v}">#{v}</option>"""

    $$('.autocomplete-meds').append(content)

    $$('.autocomplete-meds').combobox()
