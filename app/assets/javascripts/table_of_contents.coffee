class EasyEval.TableOfContents
  @initialize: ($$) ->
    $$('section').each (idx, node) ->
      if title = $(node).attr('title')
        $(node).prepend """<section_text>#{title}</section_text>"""
        $(node).attr('id', title.replace(/[^a-zA-Z0-9_]/g, '-'))
    
    $$('question').each (idx, node) ->
      if title = $(node).attr('text')
        $(node).prepend """<question_text>#{title}</question_text>"""

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
