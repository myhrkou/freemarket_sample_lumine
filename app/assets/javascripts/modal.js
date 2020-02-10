 $(function () {
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