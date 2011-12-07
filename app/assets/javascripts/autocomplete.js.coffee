window.Application ||= {}

Application.autocomplete = (field, sourceUrl, removeName, multiple) ->
  $("##{field} option:selected").each -> autocompleteAddItem($(this).val(), $(this).text(), field, removeName)
  $("##{field}").hide()
  $("##{field}").after "<div class='ui-autocomplete-wrapper input-prepend'><span class='add-on'></span><input type='text' id='#{field}_autocomplete' size='30' class='prependedInput' /></div>"
  
  # Autocomplete
  $("##{field}_autocomplete").autocomplete
    dataType: 'json' 
    source: sourceUrl 
    select: (event, ui) ->
      if $("##{field} option[value='#{ui.item.id}']").size() is 0
        autocompleteAddItem(ui.item.id, ui.item.label, field, removeName, multiple)
     
  $("##{field}_autocomplete").focus -> $(this).val('')
  $("##{field}_autocomplete").blur -> $(this).val('')
  
  $("##{field}_autocomplete_remove").live 'click', ->
    value = $(this).parent().find('input').val()
    $("##{field} option[value='#{value}']").remove()
    
    $(this).parent().remove()
    
    if $("##{field}_autocomplete_list li").size() is 0
      $("##{field}_autocomplete_list").remove()
    
    return false

autocompleteAddItem = (id, label, field, removeName, multiple) ->
  if multiple is false
    $("##{field} option").remove()
    $("##{field}_autocomplete_list li").remove()
  
  if $("##{field} option[value='#{id}']").size() is 0
    $("##{field}").append("<option value='#{id}' selected='selected'>#{label}</option>")

  if $("##{field}_autocomplete_list").size() is 0
    $("##{field}").before("<ul id='#{field}_autocomplete_list' class='inputs-list' />")  
  
  $("##{field}_autocomplete_list").append(
    "<li>#{label} <a href='#' id='#{field}_autocomplete_remove'>(#{removeName})</a><input type='hidden' value='#{id}'/></li>"
  )
