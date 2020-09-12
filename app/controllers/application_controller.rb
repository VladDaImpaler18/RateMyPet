class ApplicationController < ActionController::Base
    before_action :require_login, only: [:dashboard]

    def welcome
        #Into to application
    end

    def dashboard
        #Must be logged in
        #Comes here from Account Settings
        @picture = Picture.where(user_id: current_user.id)
    end

    private
    def require_login
        redirect_to '/' unless current_user
    end
end
