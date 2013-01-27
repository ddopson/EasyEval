class EasyEval.TableOfContents
  @initialize: ->
    content = ""
    $('section').each (idx, node) ->
      id = node.id
      label = $(node).find('section_text').first().text()
      console.log "Adding ToC entry for ##{id} = '#{label}'"
      content += """ !ijc
        li
          a(href="##{id}")
            i.icon-chevron-right
            = "#{label}"
        """
    $('#table-of-contents').append(content) 
