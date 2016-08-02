class Picture < ActiveRecord::Base
  mount_uploader :image, ImageUploader
    
  belongs_to :user
  has_many :tweets

  validate :valid_image_extension
  validate :valid_image_size

  after_validation :default_name

  def valid_image_extension
    errors.add(:image, :invalid) unless /\.(jpg|jpeg|png)$/.match self.image_url 
  end

  def valid_image_size
    errors.add(:image, :invalid) if self.image.size > 5.megabyte
  end

  def default_name
    self.name = self.image_url.reverse.split('.', 2)[1].split('/')[0].reverse.titleize
  end
end