$(document).on('turbolinks:load', function() {

  //カテゴリーの作成
  $('#work-category-lists').tagit({
    fieldName: 'work[category_list]',
    singleField: true,
    availableTags: gon.available_work_categories
  });

  //スキルの作成
  $('#work-skill-lists').tagit({
    fieldName: 'work[skill_list]',
    singleField: true,
    availableTags: gon.available_work_skills
  });
});
