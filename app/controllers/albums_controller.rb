class AlbumsController < ApplicationController
	def new
		@album=Album.new
    end

    def index
    
      @album = current_user.albums
    end

    def create
       @album = current_user.albums.new(album_params)

        respond_to do |format|
            if @album.save
     
                if params[:images]
        #===== The magic is here ;)
                    params[:images].each { |image|
                    @album.photos.create(image: image)
                      }
                end

            format.html { redirect_to @album, notice: 'album was successfully created.' }
            format.json { render json: @album, status: :created, location: @album }
            else
                format.html { render action: "new" }
                format.json { render json: @album.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @album = Album.find(params[:id])
        @album.destroy
 
        redirect_to albums_path
    end



        
    


    def show
      	@album = current_user.albums.find(params[:id])

   
    end

    def update
    	@album = current_user.albums.find(params[:id])

        respond_to do |format|
            if @album.save
            	if params[:images]
        #===== The magic is here ;)
                    params[:images].each { |image|
                    @album.photos.create(image: image)
                      }
                end


                format.html { redirect_to @album, notice: 'album was successfully created.' }
                format.json { render json: @album, status: :created, location: @album }
            else
                format.html { render action: "new" }
                format.json { render json: @album.errors, status: :unprocessable_entity }
            end
        end
    	
          
    end




 
  private
    def album_params
       params.require(:album).permit(:name, :description,:user_id)
    end
end
