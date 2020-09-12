class Picture < ApplicationRecord
    has_one :category
    has_many :comments
    belongs_to :user
    has_one_attached :image, :dependent => :destroy
    
    validates :title, :image, presence: true
end
