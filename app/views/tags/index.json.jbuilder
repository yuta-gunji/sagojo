json.array! @tags do |tag|
  json.id tag[:tag].id
  json.name tag[:tag].name
  json.count tag[:count]
end
