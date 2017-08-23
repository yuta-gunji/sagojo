json.array! @categories do |category|
  json.id category[:category].id
  json.name category[:category].name
  json.count category[:count]
end
