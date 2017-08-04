$(function(){
  $('.utility-02__image, .utility-02__user-name, .utility-02__company-name, .utility-02__select').on('click', function(){
    $('.utility-02__lists').show('slow');
    return false;
  });
  $('.utility-01__list__login').on('click', function(){
    $('.login-lists').show('slow');
    return false;
  });

  $(document).on('click', function(e) {
    if (!$(e.target).closest('.utility-02__lists').length) {
      $('.utility-02__lists').fadeOut();
    }
    if (!$(e.target).closest('.login-lists').length) {
      $('.login-lists').fadeOut();
    }
    if($('.flash_message').length !== 0){
      $('.flash_message').fadeOut("slow");
    }
  });
  $('.upper-message-01__btn').on('click', function(){
    $('.upper-message-01').fadeOut('slow');
    return false;
  });
});
