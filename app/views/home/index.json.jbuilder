json.array! @posts do |post|
    json.id post.id.to_s
    json.title post.title
    json.author post.user.nickname
    json.picture post.picture
end