class CommentsController < ApplicationController
    before_action :make_commentable, only: [:create]
    before_action :require_login

    def new
        @comment = Comment.new
      end
  
      def create
        @comment = @commentable.comments.new comment_params
        @comment.user_id=current_user.id
        binding.pry
        if @comment.save
            redirect_back(fallback_location: root_path)
        else
          #get flash to do something
            redirect_back(fallback_location: root_path)
        end
      end

      def destroy
        # replace content with "This message has been deleted" and user_id = nil and save without verify
      end
    
    private

    def comment_params
        params.require(:comment).permit(:content)
    end

    def make_commentable
        @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
        @commentable = Story.find_by_id(params[:story_id]) if params[:story_id]
    end
end
