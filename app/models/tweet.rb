class Tweet < ActiveRecord::Base
  belongs_to :twitter_account
  #before_create :post_to_twitter

  #def post_to_twitter
  #  twitter_account.twitter.update(body)
  #end
end
