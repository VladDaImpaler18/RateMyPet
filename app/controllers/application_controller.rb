class ApplicationController < ActionController::Base

    def welcome
        @pictures = Picture.all
    end
end
