class AddBankersTable < ActiveRecord::Migration
  def change
    create_table :bankers do |t|
      t.string :first_name
      t.string :last_name
      t.string :banker_email
      t.string :user_name
      t.string :password_digest

      t.timestamps
    end
  end

end
