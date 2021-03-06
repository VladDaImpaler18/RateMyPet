class ApplicationController < ActionController::Base
    before_action :require_login, only: [:dashboard]
    helper_method :owns_comment?
    helper_method :owns_picture?

    def welcome
        #Into to application
        @pictures = Picture.newest_5
    end

    def dashboard
        #Must be logged in
        #Comes here from Account Settings
        @pictures = Picture.owned_pictures(current_user)
        @comments = Comment.new_since_login(current_user).comments_from_pictures #.not_deleted to be implemented in next version
        

    end

    private
    def require_login
        redirect_to '/signup' unless current_user
    end

    def owns_picture?
        @picture ||= @comment.get_picture
        current_user.pictures.include?(@picture)
    end

    def owns_comment?
        comment = Comment.find(params[:id])
        !!(comment.user == current_user)
    end

end
