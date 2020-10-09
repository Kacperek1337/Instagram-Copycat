class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post

    validates_length_of :content, within: 3..100
end
