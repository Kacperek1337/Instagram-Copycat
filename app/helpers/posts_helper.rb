module PostsHelper
    def is_liked?(post)
       !current_user.likes.find_by(post: post).nil?
    end
end
