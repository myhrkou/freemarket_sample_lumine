$(function()  { 
  let tabs1 = $(".menu_item1");
  let tabs2 = $(".menu_item2");

  $('.menu_item1').on('click', function(){
    $(".menu_item1").removeClass("active");
    $(this).addClass("active");
    const index = tabs1.index(this);
    $(".content").removeClass("show");
    $(".content").eq(index).addClass("show");
  });

  $('.menu_item2').on('click', function(){
    $(".menu_item2").removeClass("active");
    $(this).addClass("active");
    const index = tabs2.index(this);
    $(".content2").removeClass("show2");
    $(".content2").eq(index).addClass("show2");
  });

});