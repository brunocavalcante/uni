function autocomplete(field, sourceUrl, removeName, multiple) {
  $('#' + field + ' option:selected').each(function() {
  	autocompleteAddItem($(this).val(), $(this).text(), field, removeName)
  })
  
  $('#' + field).hide()
  
  $('#' + field).after(
    '<div class="ui-autocomplete-wrapper"><input type="text" id="' + field + '_autocomplete" size="30" /></div>'
  )
  
  $('#' + field + '_autocomplete').autocomplete({
    dataType: 'json', 
    source: sourceUrl, 
    select: function (event, ui) {
    	if ($('#' + field + ' option[value="' + ui.item.id + '"]').size() == 0) {
    		autocompleteAddItem(ui.item.id, ui.item.label, field, removeName, multiple)
    	}
      $('#' + field + '_autocomplete').val('')
    }, 
    loading: function (event) {
      $(this).parent().addClass('ui-autocomplete-loading')  
    }
  }).focus(function() {
    $(this).val('')
  }).blur(function() {
    $(this).val('')
  });
  
  $('#' + field + '_autocomplete_remove').live('click', function() {
    $('#' + field + '').val('')
  
    $(this).parent().remove()
    
    if ($('#' + field + '_autocomplete_list li').size() == 0) {
      $('#' + field + '_autocomplete_list').remove()
    }
    
    return false
  });
}

function autocompleteAddItem(id, label, field, removeName, multiple) {
	if (multiple == false) {
		$('#' + field + ' option').remove()
	}
	
	if ($('#' + field + ' option[value="' + id + '"]').size() == 0) {
  	$('#' + field).append('<option value="' + id + '" selected="selected"">' + label + '</option>')
  }
  
  if ($('#' + field + '_autocomplete_list').size() == 0) {
    $('#' + field).before('<ul id="' + field + '_autocomplete_list" />')  
  }
  
  $('#' + field + '_autocomplete_list').append(
    '<li>' 
    + label
    + ' <a href="#" id="' + field + '_autocomplete_remove">(' + removeName + ')</a>' 
    + '<input type="hidden" value="' + id + '"/>' + 
    '</li>'
  )
}
