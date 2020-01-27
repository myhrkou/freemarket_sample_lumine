$(function () {
  $(".contents-mypage__left__lists__mypagelist__tag").on("click", function () {
    $(".mypagetitle").removeClass("mypagetitle");
    $(this).addClass("mypagetitle");
  });
});