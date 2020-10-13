json.array! @posts do |post|
    json.id post.id.to_s
    json.title post.title
    json.author post.user.nickname
    json.picture post.picture
    json.like_count post.likes.count
    json.comment_count post.comments.count
end