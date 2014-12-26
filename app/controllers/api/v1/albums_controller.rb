module Api
  module V1
    class AlbumsController < BaseController
      # GET /albums
      def index
        render json: Album.all
      end

      # GET /albums/1
      def show
        render json: Album.find(params[:id])
      end

      # POST /albums
      def create
        album = Album.new(album_params)

        if album.save
          head :created
        else
          render json: album.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /albums/1
      def update
        album = Album.find(params[:id])
        if album.update_attributes(album_params)
          head :no_content
        else
          render json: album.errors, status: :unprocessable_entity
        end
      end

      # DELETE /albums/1
      def destroy
        album = Album.find(params[:id])
        if album.destroy
          head :no_content
        else
          if album.errors
            render json: album.errors, status: :unprocessable_entity
          else
            head :unprocessable_entity
          end
        end
      end

      private # methods below

      def album_params
        params.permit(:id, :name, :description)
      end
    end
  end
end
