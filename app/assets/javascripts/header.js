$(function(){
  $('.utility-02__image, .utility-02__user-name, .utility-02__company-name, .utility-02__select').on('click', function(e){
    $('.utility-02__lists').show('slow');
    e.stopPropagation();
  });
  $('.login').on('click', function(e){
    $('.login-lists').show('slow');
    e.stopPropagation();
  });

  $(document).on('click', function(e) {
    $('.utility-02__lists').fadeOut();
    $('.login-lists').fadeOut();
    if($('.flash_message').length !== 0){
      $('.flash_message').fadeOut("slow");
    }
  });
  $('.upper-message-01__btn').on('click', function(){
    $('.upper-message-01').fadeOut('slow');
    return false;
  });
});
