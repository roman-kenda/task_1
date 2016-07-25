json.array!(@tweets) do |tweet|
  json.extract! tweet, :id, :twitter_account_id, :body, :picture
  json.url tweet_url(tweet, format: :json)
end
