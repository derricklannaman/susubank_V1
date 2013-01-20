class AddMembersTable < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :home_phone
      t.string :cell_phone
      t.string :member_email
      t.string :user_name
      t.string :password_digest

      t.timestamps
    end
  end


end
