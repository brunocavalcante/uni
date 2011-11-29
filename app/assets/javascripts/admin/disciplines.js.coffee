$(document).ready ->
  $('input[name*=credits]').spinner
    allowNull: true
    min: 0
    max: 999999