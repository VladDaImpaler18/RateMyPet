class Picture < ApplicationRecord
    belongs_to :category
    belongs_to :user
    has_many :comments, as: :commentable, dependent: :destroy
    has_one_attached :image, dependent: :destroy
    
    validates :title, presence: true
    validate :must_have_image

    def self.newest_5
        last(5).reverse
    end
    
    def get_authorname
        self.user.name
    end

    def category_attributes=(attributes)
        binding.pry
        #{"animal_type" => "Cat"}
        if attributes["animal_type"].present?
            attributes.values.each do |animal_type|
                animal_type.capitalize!
                category = Category.find_or_create_by(:animal_type => animal_type)
                self.category = category
            end
        end
    end

    private
    def must_have_image
        errors.add(:image, "must have an image!") if !self.image.attached?
    end
end
