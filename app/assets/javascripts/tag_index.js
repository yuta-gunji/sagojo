$(function() {

  var tag_num = $('.tag-select__lists__list').length;

  function buildTagList(tag) {
    var html = `<li class="tag-search-result__list">
                  <a class="tag-search-result__list--add", data-tag-id="${ tag.id }" data-tag-name="${ tag.name }">
                    ${ tag.name }
                  </a>
                </li>`
    $("#tag-search-result").append(html);
  }

  function selectTag(tag) {
    var tag_id = tag.attr('data-tag-id');
    var tag_name = tag.attr('data-tag-name');
    var html =
        `<li class="tag-select__lists__list" id="add_tag_${tag_num}">
           <input name='work[tag_ids][]' type='hidden' value="${ tag_id }">
           <span class='tag-select__lists__list--name'>${ tag_name }</span>
           <span class="tag-select__lists__list--delete" data-id="${ tag_num }", data-default="default">
             ×
           </span>
         </div>`
    $('.tag-select__lists').prepend(html);
  }

  function addTag(input) {
    var html =
        `<li class="tag-select__lists__list" id="add_tag_${tag_num}">
           <input class="tag-select__lists__list--added" type="hidden" name="work[tags_attributes][${ tag_num }][name]" id="tags_attributes_${tag_num}_name" value="${ input }">
           <span class='tag-select__lists__list--name'>${ input }</span>
           <a class="tag-select__lists__list--delete" data-id="${ tag_num }", data-default="default">
             ×
           </a>
         </div>`
      $('.tag-select__lists').prepend(html);
  }

  $(".tag-select__lists__input--field").on("keyup", function() {
    var input = $('.tag-select__lists__input--field').val();
    if(input !== "") {
      $('.tag-select__lists__input--add').css('display', 'inline-block');
    }
    else {
      $('.tag-select__lists__input--add').css('display', 'none')
    }
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
          buildTagList(tag);
        });
      }
    })
    .fail(function() {
      alert('検索に失敗しました');
    })
  });

  $(".tag-select__lists").on("click", function() {
    $(".tag-select__lists__input--field").focus();
  });

  $(document).on("click", ".tag-search-result__list--add", function() {
    $(this).parent().remove();
    selectTag($(this));
    $('.tag-select__lists__input--field').val('');
    $('.tag-select__lists__input--add').css('display', 'none');
    tag_num ++;
  });

  $(document).on("click", ".tag-select__lists__list--remove", function() {
    $(this).parent().remove();
  });

  $('.tag-select__lists__input--add').on('click', function() {
    var input = $('.tag-select__lists__input--field').val();
    if(input !== "") {
      addTag(input);
      $('.tag-select__lists__input--field').val('');
      $('.tag-select__lists__input--add').css('display', 'none');
      tag_num ++;
    }
  });

  $(document).on('click', '.tag-select__lists__list--delete', function() {
    var inputId = $(this).data('id');
    var defaultData = $(this).data('default');
    $('#add_tag_' + inputId).remove();
  });

});
