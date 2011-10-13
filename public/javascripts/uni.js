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

function enableAddAnotherItem(removeName) {
  $('.add-another-item').live('click', function() {
    var container = $(this).parent();
    $(container).clone().insertAfter($(container))
    var lastItemIndex = $('.add-another-item').size() - 1
    $('.add-another-item:lt(' + lastItemIndex + ')').attr('value', removeName)
                                                    .removeClass('add-another-item')
                                                    .addClass('remove-item')
    $('.add-another-item:eq(' + (lastItemIndex - 1) + ')').parent().find('input[type=text], select').val('')
  });
  
  $('.remove-item').live('click', function() {
    $(this).parent().remove()
  });
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
