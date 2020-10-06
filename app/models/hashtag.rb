class Hashtag < ApplicationRecord
    has_and_belongs_to_many :posts, -> { order(created_at: :desc) }

    validates_length_of :name, within: 1..30
    validates_uniqueness_of :name, case_sensitive: false
end
