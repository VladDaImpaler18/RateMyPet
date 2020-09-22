class PicturesController < ApplicationController
    before_action :require_login, except: [:gallery, :filter]
    before_action :set_picture, only: [:show, :edit, :update, :destroy]
    before_action :allowed_to_modify?, only: [:edit, :update, :destroy]



    def new
        @picture = Picture.new
    end

    def create
         @picture = current_user.pictures.build(picture_params)
         if @picture.image.attach(params[:picture][:image]) && @picture.save
           redirect_to picture_path(@picture)
        else
           render :new
        end
    end
    
    def show
        @comment = Comment.new
    end

    def edit
    end

    def update
        if @picture.update(picture_params)
            redirect_to picture_path(@picture)
        else
            render :edit
        end
    end

    def index
        #shows user's pictures
        @pictures = Picture.where(user_id: current_user.id)

    end

    def gallery
        #shows all pictures, does NOT require login
        @pictures = Picture.all
    end

    def filter
        #params[:filter][:category_id] => ["", "1", "3", "4"] First is ALWAYS "" is hidden value -- Can't figure out what reason it's making a hidden field
        filters = params[:filter][:category_id].collect{ |c_id| next if c_id.empty?; c_id}.compact
        if  filters.count > 0
            @pictures = Picture.category_filter(filters)
            render :gallery
        else
            @pictures = Picture.all
            render :gallery
        end
    end

    
    def destroy
        @picture.destroy
        redirect_to pictures_path
    end


    private
    
    def picture_params
        params.require(:picture).permit(:title, :description, :image, :category_id, category_attributes:[:animal_type])
    end
    def set_picture
        @picture = Picture.find_by(id: params[:id])
    end
    
 
    def allowed_to_modify?
        if !owns_picture?
            flash[:error] = "You can only edit your own pictures."
            redirect_back(fallback_location: root_path) 
        end
    end
end
