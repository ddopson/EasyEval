class EasyEval.TableOfContents
  @initialize: ($$) ->
    $$('subsection').each (idx, node) ->
      if title = $(node).attr('title')
        $(node).prepend """<section_text>#{title}</section_text>"""

    $$('section').each (idx, node) ->
      if title = $(node).attr('title')
        $(node).prepend """<section_text>#{title}</section_text>"""
        $(node).attr('id', title.replace(/[^a-zA-Z0-9_]/g, '-'))

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
    $(document.body).attr('data-spy', "scroll")
    $(document.body).attr('data-target', ".bs-docs-sidebar")
