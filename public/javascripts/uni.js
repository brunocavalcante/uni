$(document).ready(function() {
  initMultiSelect()
});

function initMultiSelect() {
  $.extend($.ui.multiselect, {
    locale: {
      addAll:'Incluir todos',
      removeAll:'Remover todos',
      itemsCount:'itens selecionados'
    }
  });
  
  $('select[multiple=multiple]').multiselect({dividerLocation: 0.5, sortable: false})
}
