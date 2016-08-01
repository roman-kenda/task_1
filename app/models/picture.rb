class Picture < ActiveRecord::Base
  mount_uploader :image, ImageUploader
    
  belongs_to :user
  has_many :tweets

  before_validation :default_name, :default_extension, :default_size

  def default_name
    self.name = token_url(self.image_url)[1].split('/')[0].reverse.titleize
  end

  def default_extension
    self.extension = token_url(self.image_url)[0].reverse
  end

  def default_size
    self.size = self.image.size
  end

  private

  def token_url(url)
    url.reverse.split('.', 2)
  end
end
