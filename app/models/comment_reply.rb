class CommentReply < ApplicationRecord
    belongs_to :comment
    belongs_to :reply
end
