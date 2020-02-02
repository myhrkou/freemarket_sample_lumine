$(function () {
  // $('#new_item').submit(function(){
  //   // バリデーションチェックや、データの加工を行う。
  //     $('#overlay').fadeIn();
  //   //バリデーションチェックの結果submitしない場合、return falseすることでsubmitを中止することができる。
  //     return false;
  // });

  $(".modal_button").click(function (e) {
    e.preventDefault();
    $(".modal").fadeIn();
    $(".modal__window__button__no").click(function (e) {
      e.preventDefault();
      $(".modal").fadeOut();
    });
    $(".modal__window__button__yes").click(function (e) {
      e.preventDefault();
      $("#delete_button").click();
    });
  });
});