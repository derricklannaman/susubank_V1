class AddOauthExpiresAtColumnToBankersTable < ActiveRecord::Migration
  def change
    add_column :bankers, :oauth_expires_at, :datetime
  end
end
