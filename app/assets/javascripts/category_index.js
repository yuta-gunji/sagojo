$(function() {

  function buildCategoryList(category) {
    var html = `<li class="category-search-result__list">
                  <a class="category-search-result__list--add", data-category-id="${ category.id }" data-category-name="${ category.name }">
                    ${ category.name }
                  </a>
                </li>`
    return html;
  }

  function addCategory(category) {
    var category_id = category.attr('data-category-id');
    var category_name = category.attr('data-category-name');
    var html = `<li class="category-select-lists__list">
                  <input name='work[category_ids][]' type='hidden' value="${ category_id }">
                  <span class='category-select-lists__list--name'>${ category_name }</span>
                  <a class='category-select-lists__list--remove'>×</a>
                </li>`

    $('.category-select-lists').prepend(html);
  }

  $(".category-select-lists__new--input").on("keyup", function() {
    var input = $(".category-select-lists__new--input").val();

    $.ajax({
      type: 'GET',
      url: '/categories',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(categories) {
      $("#category-search-result").empty();
      if (input.length !== 0 && categories.length !== 0) {
        categories.forEach(function(category) {
          var html = buildCategoryList(category);
          $("#category-search-result").append(html);
        });
      }
    })
    .fail(function() {
      alert('検索に失敗しました');
    })
  });

  $(".category-select-lists").on("click", function() {
    $(".category-select-lists__new--input").focus();
  });
  $(".category-select-lists__new--input").on("focus", function() {
    $(".category-select-lists").css('border-color', '#ffcb00');
  });
  $(document).on("click", ".category-search-result__list--add", function() {
    $(this).parent().remove();
    addCategory($(this));
    $('.category-select-lists__new--input').val('');
  });

  $(document).on("click", ".category-select-lists__list--remove", function() {
    $(this).parent().remove();
  });
});
