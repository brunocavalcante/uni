window.Application ||= {}

Application.initFormHelpers = ->
  initDatePicker()
  initTimePicker()

initDatePicker = -> $('input.date').datepicker()

initTimePicker = -> 
  $('input.time').timePicker({
    show24Hours: true,
    separator: ':',
    step: 15, 
  }).setMask('time')