// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require_tree .
$(document).ready(function() {
  initFormHelpers()
});

function initFormHelpers() {
  initDatePicker()
  initTimePicker()
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