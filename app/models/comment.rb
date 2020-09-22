class Comment < ApplicationRecord
    belongs_to :commentable, polymorphic: true
    has_many :comments, as: :commentable
    belongs_to :user

    validates :content, presence: true
    

    def build_reply(content:, user_id:)
        #takes the current comment, creates commentable from it and builds comment
        commentable = Comment.find_by_id(self.id)
        if user_signed_in?
            reply = commentable.comments.new(:user_id => current_user.id, :content => content)
        else
            reply = commentable.comments.new(:user_id => user_id, :content => content)
        end

        raise "Problem in app>models>comment.rb Comment#build_reply(*args)".inspect unless reply.valid?

        reply
    end

    def get_authorname
        self.user.name
    end

    def display_content
        deleted? ? "This message has been deleted" : content
    end

    def deleted?
        !!(content=="DELETED_COMMENT_HIDE_ME")
    end
end
