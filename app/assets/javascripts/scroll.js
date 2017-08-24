$(document).on('turbolinks:load', function(){
  var leftContentHeight = $('.left-content').height();
  $(window).scroll(function() {
    $('.right-content').css('height', leftContentHeight);
  });
});
