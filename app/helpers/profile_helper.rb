module ProfileHelper
    def avatar_url
        @user.avatar&.url || 'default.jpg'
    end
end
