$(function() {

  function buildTagList(tag) {
    var html = `<li class="tag-search-result__list">
                  <a class="tag-search-result__list--add", data-tag-id="${ tag.id }" data-tag-name="${ tag.name }">
                   ${ tag.name }
                  </a>
               </li>`
    return html;
  }

  function addTag(tag) {
    var tag_id = tag.attr('data-tag-id');
    var tag_name = tag.attr('data-tag-name');
    var html = `<li class="tag-select-lists__list">
                  <input name='work[tag_ids][]' type='hidden' value="${ tag_id }" >
                  <span class='tag-select-lists__list--name'>${ tag_name }</span>
                  <a class='tag-select-lists__list--remove'>×</a>
                </li>`

    $('.tag-select-lists').prepend(html);
  }

  $(".tag-select-lists__new--input").on("keyup", function() {
    var input = $(".tag-select-lists__new--input").val();
    $.ajax({
      type: 'GET',
      url: '/tags',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(tags) {
      $("#tag-search-result").empty();
      if (input.length !== 0 && tags.length !== 0) {
        tags.forEach(function(tag) {
          var html = buildTagList(tag);
          $("#tag-search-result").append(html);
        });
      }
    })
    .fail(function() {
      alert('検索に失敗しました');
    })
  });
  $(".tag-select-lists").on("click", function() {
    $(".tag-select-lists__new--input").focus();
  });
  $(".tag-select-lists__new--input").on("focus", function() {
    $(".tag-select-lists").css('border-color', '#ffcb00');
  });
  $(document).on("click", ".tag-search-result__list--add", function() {
    $(this).parent().remove();
    addTag($(this));
    $('.tag-select-lists__new--input').val('');
  });

  $(document).on("click", ".tag-select-lists__list--remove", function() {
    $(this).parent().remove();

  });
});
