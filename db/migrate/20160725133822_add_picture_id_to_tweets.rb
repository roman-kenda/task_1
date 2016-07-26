class AddPictureIdToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :picture_id, :integer
  end
end
