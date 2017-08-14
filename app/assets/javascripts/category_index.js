$(function() {

  var category_num = $('.category-select__lists__list').length;

  function buildCategoryList(category) {
    var html = `<li class="category-search-result__list">
                  <a class="category-search-result__list--add", data-category-id="${ category.id }" data-category-name="${ category.name }">
                    ${ category.name }
                  </a>
                </li>`
    $("#category-search-result").append(html);
  }

  function selectCategory(category) {
    var category_id = category.attr('data-category-id');
    var category_name = category.attr('data-category-name');
    var html =
        `<li class="category-select__lists__list" id="add_category_${category_num}">
           <input name='work[category_ids][]' type='hidden' value="${ category_id }">
           <span class='category-select__lists__list--name'>${ category_name }</span>
           <span class="category-select__lists__list--delete" data-id="${ category_num }", data-default="default">
             ×
           </span>
         </div>`
    $('.category-select__lists').prepend(html);
  }

  function addCategory(input) {
    var html =
        `<li class="category-select__lists__list" id="add_category_${category_num}">
           <input class="category-select__lists__list--added" type="hidden" name="work[categories_attributes][${ category_num }][name]" id="categories_attributes_${category_num}_name" value="${ input }">
           <span class='category-select__lists__list--name'>${ input }</span>
           <a class="category-select__lists__list--delete" data-id="${ category_num }", data-default="default">
             ×
           </a>
         </div>`
      $('.category-select__lists').prepend(html);
  }

  $(".category-select__lists__input--field").on("keyup", function() {
    var input = $('.category-select__lists__input--field').val();
    if(input !== "") {
      $('.category-select__lists__input--add').css('display', 'inline-block');
    }
    else {
      $('.category-select__lists__input--add').css('display', 'none')
    }
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
          buildCategoryList(category);
        });
      }
    })
    .fail(function() {
      alert('検索に失敗しました');
    })
  });

  $(".category-select__lists").on("click", function() {
    $(".category-select__lists__input--field").focus();
  });

  $(document).on("click", ".category-search-result__list--add", function() {
    $(this).parent().remove();
    selectCategory($(this));
    $('.category-select__lists__input--field').val('');
    $('.category-select__lists__input--add').css('display', 'none');
    category_num ++;
  });

  $(document).on("click", ".category-select__lists__list--remove", function() {
    $(this).parent().remove();
  });

  $('.category-select__lists__input--add').on('click', function() {
    var input = $('.category-select__lists__input--field').val();
    if(input !== "") {
      addCategory(input);
      $('.category-select__lists__input--field').val('');
      $('.category-select__lists__input--add').css('display', 'none');
      category_num ++;
    }
  });

  $(document).on('click', '.category-select__lists__list--delete', function() {
    var inputId = $(this).data('id');
    var defaultData = $(this).data('default');
    $('#add_category_' + inputId).remove();
  });

});
