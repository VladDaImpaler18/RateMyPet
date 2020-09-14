class PicturesController < ApplicationController
    before_action :require_login, only: [:new, :create, :index]

    def new
        @picture = Picture.new
    end

    def create
        @picture = current_user.pictures.build(picture_params)
        binding.pry
        if @picture.image.attach(params[:picture][:image]) && @picture.save
           session[:picture_id] = @picture.id
           redirect_to picture_path(@picture)
        else
           flash[:errors] = @picture.errors.full_message
           redirect_to new_picture_path(@picture)
        end
    end
    
    def show
        binding.pry
    end

    def index
        #shows user's pictures
        binding.pry
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
