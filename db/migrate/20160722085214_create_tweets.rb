class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :twitter_account_id
      t.text :body
      t.string :picture

      t.timestamps null: false
    end
  end
end
