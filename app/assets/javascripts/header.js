$(function(){
  function appendHTML(){
    var html = '<ul class="utility-02__lists">'+
                  '<li class="utility-02__lists__list">'+
                    '<a href="/", class="utility-02__lists__list__link", data-method="get">応募した仕事</a>'+
                  '</li>'+
                  '<li class="utility-02__lists__list">'+
                    '<a href="/", class="utility-02__lists__list__link", , data-method="get">お気に入り一覧</a>'+
                  '</li>'+
                  '<li class="utility-02__lists__list">'+
                    '<a href="/", class="utility-02__lists__list__link", , data-method="get">プロフィール編集</a>'+
                  '</li>'+
                  '<li class="utility-02__lists__list">'+
                    '<a href="/", class="utility-02__lists__list__link", , data-method="get">アカウント設定</a>'+
                  '</li>'+
                  '<li class="utility-02__lists__list utility-02__lists__list--last">'+
                    '<a href="/users/sign_out", class="utility-02__lists__list__link utility-02__lists__list__link--color", data-method="delete">ログアウト</a>'+
                  '</li>'+
                '</ul>'
    $('.utility-02').append(html);
  }

  $('.utility-02__image, .utility-02__user-name,  .utility-02__select').on('click', function(){
    if($('.utility-02__lists').length == 0){
      appendHTML();
      return false;
    }
  });
  $("body").on("click", function(){
    $('.utility-02__lists').remove();
    $('.flash_message').fadeOut("slow");
  });
});
