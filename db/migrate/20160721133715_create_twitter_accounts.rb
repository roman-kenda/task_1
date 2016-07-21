class CreateTwitterAccounts < ActiveRecord::Migration
  def change
    create_table :twitter_accounts do |t|
      t.integer :user_id
      t.string :uid
      t.string :token
      t.string :secret

      t.timestamps null: false
    end
  end
end
