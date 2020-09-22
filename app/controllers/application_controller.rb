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
        @pictures = Picture.where(user_id: current_user.id)
    end

    private
    def require_login
        redirect_to '/' unless current_user
    end

    def owns_picture?
        picture_id = params[:id] || params[:picture_id]
        current_user.pictures.include?(Picture.find(picture_id))
    end

    def owns_comment?
        comment = Comment.find(params[:id])
        !!(comment.user == current_user)
    end

end
