class Comment < ApplicationRecord
    belongs_to :picture
    belongs_to :user
    has_many :comment_reply
    has_many :replies, through: :comment_reply
end
