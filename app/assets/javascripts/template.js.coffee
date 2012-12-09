# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


class window.EditBar extends Backbone.View
  render: ->
    @$el.html """ !ijc
      .navbar
        .navbar-inner
          form.form-horizontal
            .control-group
              label.control-label Label:
              input#node-label.input-medium(type="text", disabled="true")

            .control-group
              label.control-label FIELD_NAME:
              input#node-field(type="text", disabled="true")

            .control-group
              label.control-label Placeholder Text:
              input#node-placeholder(type="text", disabled="true")
              placeholder
    """
    @$('input').on 'blur', @onBlur.bind(@)

  NODE_FN =
    # These are both getters and setters
    label:       (node, args...) -> node.find('label').text(args...)
    field:       (node, args...) -> node.find('input').attr('name', args...)
    placeholder: (node, args...) -> node.find('input').attr('placeholder', args...)

  edit: (node, type) ->
    @$node.removeClass('being-edited') if @$node
    @$node = $(node)
    @$node.addClass('being-edited')

    for field, fn of NODE_FN
      val = fn(@$node)
      @$("#node-#{field}").val(val).attr('disabled', false)

  onBlur: ->
    if @$node
      for field, fn of NODE_FN
        old_val = fn(@$node)
        new_val = @$("#node-#{field}").val()
        if new_val != old_val
          # TODO: mark changed fields in yellow
          fn(@$node, new_val)


class window.TemplateEditor

  @initialize: ->
    $(document).on 'click', '.tf-text', -> TemplateEditor.editLabel(@)
    @editbar = new EditBar(el: $('#edit-bar'))
    @editbar.render()

  @editLabel: (node) ->
    @editbar.edit(node)
