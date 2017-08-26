$(document).on 'turbolinks:load', ->
  $('#work-category-lists').tagit
    fieldName:   'work[category_list]'
    singleField: true
    availableTags: gon.available_work_categories

  $('#work-tag-lists').tagit
    fieldName:   'work[skill_list]'
    singleField: true
    availableTags: gon.available_work_skills
