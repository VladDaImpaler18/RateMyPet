class Comment < ApplicationRecord
    belongs_to :commentable, polymorphic: true
    has_many :comments, as: :commentable
    belongs_to :user
    scope :new_since_login, -> (user) { where("created_at > ?", user.last_sign_in_at) }
    scope :comments_from_pictures, -> { where(commentable_type: 'Picture')}
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

    def get_picture
        comment = self
        until comment.commentable_type=="Picture" do
            comment = comment.parent_comment
        end
        pic = Picture.find_by_id(comment.commentable_id)
    end

    def parent_comment
        if commentable_type=="Comment" #If this is a reply to a comment
            parent = Comment.find_by_id(commentable_id)
        else #If this is a comment to a picture
        end
        parent
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
