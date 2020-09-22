class CommentsController < ApplicationController
    before_action :make_commentable, only: [:create, :destroy]
    before_action :require_login
    before_action :allowed_to_modify?, only: [:edit, :update, :destroy]


    def new
        @comment = Comment.new
      end
  
      def create
        @comment = @commentable.comments.new comment_params
        @comment.user_id=current_user.id
        if @comment.save
          redirect_to @comment.get_picture
        else
          @picture = @comment.get_picture
          render 'pictures/show'
        end
      end

      def destroy
        @comment = Comment.find(params[:id])
        @comment.content="DELETED_COMMENT_HIDE_ME"
        if @comment.save
          picture = @comment.get_picture
          redirect_to picture_path(picture)
        else
          redirect_back(fallback_location: root_path)
        end
      end
    
    private

    def comment_params
        params.require(:comment).permit(:content)
    end

    def make_commentable
        @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
        @commentable = Picture.find_by_id(params[:picture_id]) if params[:picture_id]
    end

    def allowed_to_modify?
      if !owns_comment?
        redirect_back(fallback_location: root_path)
        #error message saying not allowed to edit a comment you didn't make. Brings back to page?   
      end
    end
end
