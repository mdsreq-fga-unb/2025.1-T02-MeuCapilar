class ImageConversion < ApplicationRecord
  has_one_attached :uploaded_image
  has_one_attached :converted_image

  validates :uploaded_image, presence: true
  validate :uploaded_image_format

  after_commit :convert_image, on: :create

  private

  def uploaded_image_format
    if uploaded_image.attached? && uploaded_image.content_type != 'image/bmp'
      errors.add(:uploaded_image, 'deve ser um arquivo BMP')
    end
  end

  def convert_image
    return unless uploaded_image.attached?

    bmp_tempfile = Tempfile.new(['original', '.bmp'])
    bmp_tempfile.binmode
    bmp_tempfile.write(uploaded_image.download)
    bmp_tempfile.rewind

    image = MiniMagick::Image.open(bmp_tempfile.path)
    png_tempfile = Tempfile.new(['converted', '.png'])
    image.format 'png'
    image.write png_tempfile.path

    converted_image.attach(
      io: File.open(png_tempfile.path),
      filename: "#{uploaded_image.filename.base}.png",
      content_type: 'image/png'
    )
  ensure
    bmp_tempfile&.close!
    png_tempfile&.close!
  end
end
