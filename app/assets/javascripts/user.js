$(document).on('turbolinks:load', function() {
  // カテゴリーの作成
  $('#user-category-lists').tagit({
    fieldName: 'user[category_list]',
    singleField: true,
    availableTags: gon.available_user_categories
  });

  //登録済みのカテゴリーの表示
  if (gon.user_categories != null) {
    var i, len, ref, tag;
    ref = gon.user_categories;
    for (i = 0, len = ref.length; i < len; i++) {
      tag = ref[i];
      $('#user-category-lists').tagit('createTag', tag);
    }
  }

  //スキルの作成
  $('#user-skill-lists').tagit({
    fieldName: 'user[skill_list]',
    singleField: true,
    availableTags: gon.available_user_skills
  });

  //登録済みのスキルの表示
  if (gon.user_skills != null) {
    var i, len, ref, tag;
    ref = gon.user_skills;
    for (i = 0, len = ref.length; i < len; i++) {
      tag = ref[i];
      $('#user-skill-lists').tagit('createTag', tag);
    }
  }

});
