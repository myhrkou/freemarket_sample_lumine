$(function () {
  $('.carousel').slick({
    autoplay:true,
    autoplaySpeed:7000,
    dots:true,
    dots:false,
    speed:500,
    prevArrow: '<button class="slide-arrow prev-arrow"></button>',
    nextArrow: '<button class="slide-arrow next-arrow"></button>'
  });
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
    // centerMode: true,
    centerPadding: '30px',
    asNavFor: '.slick1',
  });
});