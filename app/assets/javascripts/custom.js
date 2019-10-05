$(document).ready(function() {


    $(".btn-toggle,.close_panel").click(function() {
		$("body").toggleClass("toggle-wrapper");
     });


    $('.datepicker').datepicker();

    /* =====Side Panel=== */
    if ($(window).width() < 1025) {
        $('body').removeClass('toggle-wrapper');
    } 
    $(window).resize(function() {
        if ($(window).width() < 1025) {
           $('body').removeClass('toggle-wrapper');
        } 
    });

    $(document).on("click",".top-user-img",function(){
  $(".head-drop-down").toggleClass("show"); 
  });

});

/* Ready End */

