$(document).ready(function() {
  initMultiSelect()
  initDatePicker()
});

function initMultiSelect() {
  $.extend($.ui.multiselect, {
    locale: {
      addAll:'Incluir todos',
      removeAll:'Remover todos',
      itemsCount:'selecionado(s)'
    }
  });
  
  $('select[multiple=multiple]').multiselect({dividerLocation: 0.5, sortable: false})
}

function initDatePicker() {
  $('input.date').datepicker()
}

function autocomplete(field, sourceUrl, removeName) {
  $('#' + field).after('<input type="hidden" id="' + field + '" name="' + field + '" />');
  $('#' + field).remove()
  $('#' + field).hide()
  $('#' + field).before('<ul id="' + field + '_autocomplete_list" />')
  $('#' + field).after('<input type="text" id="' + field + '_autocomplete" />')
  
  $('#' + field + '_autocomplete').autocomplete({
    dataType: 'json', 
    source: sourceUrl, 
    select: function (event, ui) {
      $('#' + field + '').val(ui.item.id)
      $('#' + field + '_autocomplete_list li').remove()
      $('#' + field + '_autocomplete_list').append(
          '<li>' + ui.item.label + ' <a href="#" id="' + field + '_autocomplete_remove">(' + removeName + ')</a></li>'
      )
      $('#' + field + '_autocomplete').val('')
    }
  }).focus(function() {
    $(this).val('')
  }).blur(function() {
    $(this).val('')
  });
  
  $('#' + field + '_autocomplete_remove').live('click', function() {
    $('#' + field + '').val('')
    $(this).parent().remove()
    return false
  });
}
