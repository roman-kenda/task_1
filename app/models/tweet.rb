class Tweet < ActiveRecord::Base
  include Twitter::Validation

  belongs_to :twitter_account
  belongs_to :picture

  validate :error_tweet_invalid

  def error_tweet_invalid
   errors.add(:body, :invalid) if tweet_invalid? self.body
  end
end
