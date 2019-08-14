json.array! @tags do |tag|
  json.key "#{tag.name} (#{tag.cached_count})"
  json.value tag.name
end
