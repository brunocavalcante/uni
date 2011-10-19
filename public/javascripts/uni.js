$(document).ready(function() {
  initFormHelpers()
});

function initFormHelpers() {
  initMultiSelect()
  initDatePicker()
  initTimePicker()
}

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

function initTimePicker() {
  $('input.time').timePicker({
    show24Hours: true,
    separator: ':',
    step: 15, 
  }).setMask('time');
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
    initFormHelpers()
  });
  
  $('.remove-item').live('click', function() {
    $(this).parent().remove()
  });
}

function autocomplete(field, sourceUrl, removeName) {
  var value = $('#' + field).val();
  
  $('#' + field).after('<input type="hidden" id="' + field + '" name="' + field + '" value="' + value + '" />');
  $('#' + field).remove()
  $('#' + field).hide()
  
  $('#' + field).after(
    '<div class="ui-autocomplete-wrapper"><input type="text" id="' + field + '_autocomplete" size="30" /></div>'
  )
  
  $('#' + field + '_autocomplete').autocomplete({
    dataType: 'json', 
    source: sourceUrl, 
    select: function (event, ui) {
      $('#' + field + '').val(ui.item.id)
      if ($('#' + field + '_autocomplete_list').size() == 0) {
        $('#' + field).before('<ul id="' + field + '_autocomplete_list" />')  
      }
      
      $('#' + field + '_autocomplete_list li').remove()
      $('#' + field + '_autocomplete_list').append(
        '<li>' + ui.item.label + ' <a href="#" id="' + field + '_autocomplete_remove">(' + removeName + ')</a></li>'
      )
      $('#' + field + '_autocomplete').val('')
    }, 
    loading: function (event) {
      alert('oi')
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