json.post do
    json.merge! @post.as_json
    json.like_count @post.likes.count
end
