$(document).ready(function(){
  var scroll_pos = 0;
  $(document).scroll(function() {
      scroll_pos = $(this).scrollTop();
      if(scroll_pos > 100) {
          $("#navbar_white").css('background-color', 'rgba(255,255,255, 0.95)');
          $('.nav li a').css('color', '#2d323d');
      } else {
          $("#navbar_white").css('background-color', '');
          $('.nav li a').css('color', '');
      }
  });
  $(function() {
    $('a[href*=#]:not([href=#])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {

      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: target.offset().top
        }, 1000);
        return false;
      }
    }
    });
  });

  $('.navbar-header button').click(function() {
    $('.app-aside').addClass('off-screen');
  });
  $('#close-menu').click(function() {
    $('.app-aside').removeClass('off-screen');
  });
});

