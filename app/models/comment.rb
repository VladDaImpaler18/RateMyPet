class Comment < ApplicationRecord
    belongs_to :picture
    #has_many :comment_reply #is this correct?
    belongs_to :user
    has_many :replies, through: :comment_reply
end
