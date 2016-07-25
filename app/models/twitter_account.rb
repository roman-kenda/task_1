class TwitterAccount < ActiveRecord::Base
  belongs_to :user
  has_many :tweets, dependent: :destroy
  
  validates :uid, uniqueness: true

  def twitter
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_api_key
      config.consumer_secret     = Rails.application.secrets.twitter_api_secret
      config.access_token        = token
      config.access_token_secret = secret
    end
  end
end
