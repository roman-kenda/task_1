class TwitterAccount < ActiveRecord::Base
  belongs_to :user
  has_many :tweets, dependent: :destroy
  
  validates :uid, uniqueness: true
end
