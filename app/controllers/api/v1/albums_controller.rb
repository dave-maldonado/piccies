module Api
  module V1
    class AlbumsController < BaseController
      # GET /albums
      # GET /albums.json
      def index
        @albums = Album.all

        render json: @albums
      end

      # GET /albums/1
      # GET /albums/1.json
      def show
        @album = Album.find(params[:id])

        render json: @album
      end

      # POST /albums
      # POST /albums.json
      def create
        @album = Album.new(album_params)

        if @album.save
          render json: @album, status: :created, location: @album
        else
          render json: @album.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /albums/1
      # PATCH/PUT /albums/1.json
      def update
        @album = Album.find(params[:id])

        if @album.update(album_params)
          head :no_content
        else
          render json: @album.errors, status: :unprocessable_entity
        end
      end

      # DELETE /albums/1
      # DELETE /albums/1.json
      def destroy
        @album = Album.find(params[:id])
        @album.destroy

        head :no_content
      end

      private # methods below

      def album_params
        params.require(:album).permit(:name, :description)
      end
    end
  end
end
