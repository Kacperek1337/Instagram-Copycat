module ProfileHelper
    def avatar_url
        @user.avatar&.url || 'default.jpg'
    end

    def is_followed?
        @user.followers.include? current_user
    end
end
