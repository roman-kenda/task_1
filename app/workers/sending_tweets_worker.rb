class SendingTweetsWorker < ActiveJob::Base
  #include Sidekiq::Worker
  queue_as :default

  def perform(tweet)
    if tweet.picture
      tweet.twitter_account.twitter.update_with_media(tweet.body, File.new(tweet.picture.image.path))
    else
      tweet.twitter_account.twitter.update(tweet.body)
    end
    tweet.update(was_send: true, date_send: DateTime.now)
  end
end