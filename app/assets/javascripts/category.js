$(function(){
  $(".header__bottom__left__category").hover(function(){
    $(".category0s").show();
  },function(){
    $(".category0s").hide();
  })

  $(".category0").hover(function(){
    $(this).children(".category1s").show();
  },function(){
    $(this).children(".category1s").hide();
  })

  $(".category1").hover(function(){
    $(this).children(".category2s").show();
  },function(){
    $(this).children(".category2s").hide();
  })
});