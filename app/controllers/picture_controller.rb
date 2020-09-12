class PictureController < ApplicationController

    def create
        @picture = Picture.new(picture_params)
        if @picture.save
           session[:picture_id] = @picture.id
           redirect_to picture_path(@picture)
        else
           flash[:errors] = @picture.errors.full_message
           redirect_to new_picture_path(@picture)
        end
    end


    private

    def picture_params
        params.require[:picture].permit(:title, :description, :image)
    end
end
