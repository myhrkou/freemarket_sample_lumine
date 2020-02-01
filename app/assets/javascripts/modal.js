$(function () {
  $('#new_item').submit(function(){
    // バリデーションチェックや、データの加工を行う。
      $('#overlay').fadeIn();
    //バリデーションチェックの結果submitしない場合、return falseすることでsubmitを中止することができる。
      return false;
  });
});



