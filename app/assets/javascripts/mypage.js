$(function () {
  $(".contents-mypage__left__lists__mypagelist__tag").on("click", function () {
    $(".mypagetitle").removeClass("mypagetitle");
    $(this).addClass("mypagetitle");
  });

  $(".contents-mypage__right__exhibition__tab__button").click(function(){
    $(".contents-mypage__right__exhibition__tab__button").removeClass(".active1");
    $(this).addClass(".active1");
  });
});