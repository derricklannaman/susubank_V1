class AddOauthTokenColumnToBankersTable < ActiveRecord::Migration
  def change
    add_column :bankers, :oauth_token, :string
  end
end
