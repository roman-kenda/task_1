class Picture < ActiveRecord::Base
  mount_uploader :image, ImageUploader
    
  belongs_to :user

 # validates :image, file_size: { less_than_or_equal_to: 5.megabytes },
 #                   file_content_type: { allow: ['image/jepg', 'image/png'] }
end
