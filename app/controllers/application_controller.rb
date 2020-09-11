class ApplicationController < ActionController::Base

    def welcome
        @pictures = Picture.all
    end

    def dashboard
        @picture = Picture.where(user_id: current_user.id)
    end
end
