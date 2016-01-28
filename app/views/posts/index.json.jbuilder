json.array! @posts.each do |post|
  json.id post.id
  json.path post.path
  json.body post.body
  json.created_user do |json|
    json.name post.created_user.name
  end

end
