module Api
  module V1
    class PicturesController < BaseController
      # before_filter :get_album

      # def get_album
      #   @album = Album.find(params[:album_id])
      # end

      # GET album/1/pictures
      def index
        render json: Picture.where(picture_params)
      end

      # GET album/1/pictures/1
      def show
        render json: Picture.where(picture_params)
      end

      # POST /pictures
      def create
        picture = Picture.new(picture_params)

        if picture.save
          head :created
        else
          render json: picture.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /pictures/1
      def update
        picture = Picture.find(params[:id])

        if picture.update_attributes(picture_params)
          head :no_content
        else
          render json: picture.errors, status: :unprocessable_entity
        end
      end

      # DELETE /pictures/1
      def destroy
        picture = Picture.find(params[:id])
        if picture.destroy
          head :no_content
        else
          if picture.errors
            render json: picture.errors, status: :unprocessable_entity
          else
            head :unprocessable_entity
          end
        end
      end

      private # methods below

      def picture_params
        params.permit(:id, :album_id, :caption, :description,
                      :content_type, :width, :height)
      end
    end
  end
end
