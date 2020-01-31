class PhotosController < ApplicationController
	def destroy

		@photo = Photo.find(params[:id])

		@photo.destroy
 
        redirect_to album_path(params[:album_id])

	end

	def show

       	@photo= Photo.find(params[:id])
	end
end
