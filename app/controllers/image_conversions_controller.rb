class ImageConversionsController < ApplicationController
  def new
    @image_conversion = ImageConversion.new
  end

  def create
    @image_conversion = ImageConversion.new(image_conversion_params)
    if @image_conversion.save
      redirect_to @image_conversion
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @image_conversion = ImageConversion.find(params[:id])
  end

  def download
    @image_conversion = ImageConversion.find(params[:id])
    if @image_conversion.converted_image.attached?
      send_data @image_conversion.converted_image.download,
                filename: "convertida.png",
                content_type: "image/png"
    else
      redirect_to @image_conversion, alert: "Imagem convertida não encontrada"
    end
  end

  private

  def image_conversion_params
    params.require(:image_conversion).permit(:uploaded_image)
  end
end
