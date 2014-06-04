# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#accounts-container').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#accounts-container').data('source')
    bSort: false
  $('#transaction-container').toggleClass("selected", true);
  $(".tabs label").click ->
    self = $(this)
    self.siblings().removeClass "active"
    self.addClass "active"
    return

window.selectAction = (action) ->
  switch action
    when "transaction"
      $('#transaction-container').toggleClass("selected", true);
      $('#account-container').toggleClass("selected", false);
      $('#transfer-container').toggleClass("selected", false);
    when "account"
      $('#account-container').toggleClass("selected", true);
      $('#transaction-container').toggleClass("selected", false);
      $('#transfer-container').toggleClass("selected", false);
    when "transfer"
      $('#transfer-container').toggleClass("selected", true);
      $('#transaction-container').toggleClass("selected", false);
      $('#account-container').toggleClass("selected", false);
