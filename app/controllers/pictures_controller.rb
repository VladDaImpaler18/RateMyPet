class PicturesController < ApplicationController
    before_action :require_login, only: [:new, :create, :index]

    def new
        @picture = Picture.new
    end

    def create
        @picture = current_user.pictures.build(picture_params)
        if @picture.image.attach(params[:picture][:image]) && @picture.save
           #user_session[:picture_id] = @picture.id is this even needed?
           redirect_to picture_path(@picture)
        else
           flash[:errors] = @picture.errors.full_message
           redirect_to new_picture_path(@picture)
        end
    end
    
    def show
        @picture = Picture.find_by(id: params[:picture_id]) 
    end

    def index
        #shows user's pictures
        @pictures = Picture.where(user_id: current_user.id)

    end

    def gallery
        #shows all pictures
        @pictures = Picture.all
    end


    private
    
    def picture_params
        params.require(:picture).permit(:title, :description, :image)
    end

end
