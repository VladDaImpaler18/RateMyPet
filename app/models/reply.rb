class Reply < ApplicationRecord
    has_many :comment_remplies
    has_many :comments, through: :comment_replies
    belongs_to :user
end
