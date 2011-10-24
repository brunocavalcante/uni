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
