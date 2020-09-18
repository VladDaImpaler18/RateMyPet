class PicturesController < ApplicationController
    before_action :require_login#, only: [:new, :create, :index]
    before_action :set_picture, only: [:show, :edit, :update]

    def new
        @picture = Picture.new
    end

    def create
         @picture = current_user.pictures.build(picture_params)
         if @picture.image.attach(params[:picture][:image]) && @picture.save
           #user_session[:picture_id] = @picture.id is this even needed?
           redirect_to picture_path(@picture)
        else
           flash[:errors] = @picture.errors.full_messages
           redirect_to new_picture_path(@picture)
        end
    end
    
    def show
    end

    def edit
    end

    def update
        @picture.update(picture_params)
        redirect_to picture_path(@picture)
    end

    def index
        #shows user's pictures
        @pictures = Picture.where(user_id: current_user.id)

    end

    def gallery
        #shows all pictures
        @pictures = Picture.all
    end
    
    def destroy
        binding.pry
    end


    private
    
    def picture_params
        params.require(:picture).permit(:title, :description, :image, :category_id, category_attributes:[:animal_type])
    end
    def set_picture
        @picture = Picture.find_by(id: params[:id])
    end

end
