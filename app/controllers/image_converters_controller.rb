class ImageConvertersController < ApplicationController
  def index
    @image_converters = ImageConverter.all.order(created_at: :desc)
  end

  def show
    @image_converter = ImageConverter.find(params[:id])
  end

  def new
    @image_converter = ImageConverter.new
  end

  def create
    @image_converter = ImageConverter.new(image_converter_params)
    
    # Garantir que as imagens sejam salvas corretamente
    if params[:image_converter][:original_images].present?
      # Filtrar entradas vazias
      filtered_images = params[:image_converter][:original_images].reject(&:blank?)
      
      if filtered_images.any?
        if @image_converter.save
          # A conversão será feita pelo callback after_commit
          redirect_to @image_converter, notice: 'Imagens enviadas e convertidas com sucesso!'
        else
          render :new, status: :unprocessable_entity
        end
      else
        @image_converter.errors.add(:original_images, "você deve selecionar pelo menos uma imagem")
        render :new, status: :unprocessable_entity
      end
    else
      @image_converter.errors.add(:original_images, "você deve selecionar pelo menos uma imagem")
      render :new, status: :unprocessable_entity
    end
  end

  private

  def image_converter_params
    params.require(:image_converter).permit(:name, original_images: [])
  end
end 