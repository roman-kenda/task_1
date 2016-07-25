class AddNameLinkToTwitterAccount < ActiveRecord::Migration
  def change
    add_column :twitter_accounts, :name, :string
    add_column :twitter_accounts, :link, :string
  end
end
