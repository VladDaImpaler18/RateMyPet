class Picture < ApplicationRecord
    has_one :category
    has_many :comments
    belongs_to :user
end
