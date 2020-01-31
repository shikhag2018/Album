class TagsController < ApplicationController
	def new
        @photo=Photo.find(params[:photo_id])
		@tag=Tag.new

	end

    def create
        @photo= Photo.find(params[:photo_id]) 
        @album=@photo.album
        @tag = @photo.tags.create(tag_params)
        redirect_to album_path(@album)


    end


	def update
        
      
	end

	def destroy
    
	end
   
    private

    def tag_params
    	params.require(:tag).permit(:Addtags)
    end
end
