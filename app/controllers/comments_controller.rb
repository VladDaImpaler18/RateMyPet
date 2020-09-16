class CommentsController < ApplicationController
    before_action :make_commentable, only: [:create]
    before_action :require_login

    def new
        @comment = Comment.new
      end
  
      def create
        @comment = @commentable.comments.new comment_params
        @comment.user_id=current_user.id
        if @comment.save
          redirect_back(fallback_location: root_path)#, notice: "Comment Posted"
        else
          redirect_back(fallback_location: root_path)#, notice: "Comment Error"
        end
      end

      def destroy
        binding.pry
        # replace content with "This message has been deleted" and user_id = nil and save without verify
      end
    
    private

    def comment_params
        params.require(:comment).permit(:content)
    end

    def make_commentable
        @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
        @commentable = Picture.find_by_id(params[:picture_id]) if params[:picture_id]
    end
end
