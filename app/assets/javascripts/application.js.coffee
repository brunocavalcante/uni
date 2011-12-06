//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require vendor
//= require_tree .

$(document).ready ->
  Application.initFormHelpers()
  $('.topbar').dropdown()