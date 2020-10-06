class Post < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :hashtags

    before_create :randomize_id

    mount_uploader :picture, PictureUploader

    after_save_commit :set_hashtags

    validates_length_of :title, within: 3..100
    validates_length_of :description, maximum: 200
    validates_presence_of :picture
    validate :picture_size

    protected

        def randomize_id
            loop do
                self.id = SecureRandom.random_number(9_223_372_036_854_775_807)
                raise StopIteration unless User.where(id: id).exists?
            end
        end

        def picture_size
            errors.add(:picture, 'cannot exceed 3 megabytes') if picture.size > 3.megabytes
        end

        def find_hashtags(str)
            str.scan(/#\w{1,30}/).map(&:downcase).uniq.each do |ht|
                yield ht.downcase[1..] if block_given?
            end
        end

        def set_hashtags
            find_hashtags(description) do |ht|
                hashtags << (Hashtag.find_by(name: ht) || Hashtag.create(name: ht) )
            end
        end
end
