$(function () {
  $(".contents-mypage__left__lists__mypagelist__tag").on("click", function () {
    $(".mypagetitle").removeClass("mypagetitle");
    $(this).addClass("mypagetitle");
  });

  $(".contents-mypage__right__exhibition__tab__button").click(function(){
    $(".contents-mypage__right__exhibition__tab__button").removeClass(".active1");
    $(this).addClass(".active1");
  });

// function buildhtml(){
//   var html=`<img src=current_user.image class="userface">`;
//   return html;
// };

  // $(".profile_image").on("change",function(){
  //   alert("aa");
  //   // $(".userface").removeAttr("src");
  //   // $(".userface").attr('src','current_user.image.url');
  //   $(".userface").remove();
  //   $(".profile_image").append(buildhtml);
  // });
});