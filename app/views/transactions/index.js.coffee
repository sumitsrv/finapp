jQuery ->
  $('#accounts-container').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#accounts-container').data('source')
    bSort: false
