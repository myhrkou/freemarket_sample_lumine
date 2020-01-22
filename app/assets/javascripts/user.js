$(function () {
  var pw = $('#pfield');
  var pwCheck = $('.checkbox_box');
  pwCheck.click(function () {
    if (pwCheck.prop("checked")) {
      pw.attr('type', 'text');
    } else {
      pw.attr('type', 'password');
    }
  });
});