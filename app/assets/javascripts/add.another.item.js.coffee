window.Application ||= {}

Application.enableAddAnotherItem = (removeName) ->
  $('.add-another-item').live('click', ->
    container = $(this).parent();
    $(container).clone().insertAfter($(container))
    lastItemIndex = $('.add-another-item').size() - 1
    $(".add-another-item:lt(#{lastItemIndex})").attr('value', removeName).removeClass('add-another-item').addClass('remove-item')
    $(".add-another-item:eq(#{(lastItemIndex - 1)})").parent().find('input[type=text], select').val('')
    Application.initFormHelpers()
  )
  
  $('.remove-item').live('click', () -> $(this).parent().remove())