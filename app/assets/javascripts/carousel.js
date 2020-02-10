$(function () {
  $('.slick1').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: false,
    asNavFor: '.slick2'
  });
  $('.slick2').slick({
    slidesToShow: 3,
    slidesToScroll: 1,
    arrows:false,
    focusOnSelect: true,
    centerMode: true,
    centerPadding: 80,
    asNavFor: '.slick1',
    
  });
});


