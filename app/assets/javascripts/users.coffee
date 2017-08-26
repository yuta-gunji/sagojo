$(document).on 'turbolinks:load', ->
  $('#user-category-lists').tagit
    fieldName:   'user[category_list]'
    singleField: true
    availableTags: gon.available_user_categories

  if gon.user_categories?
    for tag in gon.user_categories
      $('#user-category-lists').tagit 'createTag', tag

  $('#user-skill-lists').tagit
    fieldName:   'user[skill_list]'
    singleField: true
    availableTags: gon.available_user_skills

  if gon.user_skills?
    for tag in gon.user_skills
      $('#user-skill-lists').tagit 'createTag', tag
