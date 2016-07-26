class RemovePictureFromTweets < ActiveRecord::Migration
  def change
    remove_column :tweets, :picture, :string
  end
end
