class Picture < ApplicationRecord
    belongs_to :category
    has_many :comments, as: :commentable, dependent: :destroy
    belongs_to :user
    has_one_attached :image, dependent: :destroy
    
    validates :title, presence: true

    def self.newest_5
        last(5).reverse
    end
    def get_authorname
        self.user.name
    end
end
