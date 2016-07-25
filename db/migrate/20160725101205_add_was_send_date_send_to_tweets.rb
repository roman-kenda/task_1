class AddWasSendDateSendToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :was_send, :boolean
    add_column :tweets, :date_send, :datetime
  end
end
