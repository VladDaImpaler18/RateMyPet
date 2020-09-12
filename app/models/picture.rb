class Picture < ApplicationRecord
    has_one :category
    has_many :comments
    belongs_to :user
    has_one_attached :image, :dependent => :destroy
    
    validates :title, :image, presence: true

    def self.newest_5
        last(5)
    end
end
