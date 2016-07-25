class SendingTweetsWorker < ActiveJob::Base
  #include Sidekiq::Worker
  queue_as :default

  def perform(tweet)
    tweet.twitter_account.twitter.update(tweet.body)
    tweet.update(was_send: true, date_send: DateTime.now)
  end
end