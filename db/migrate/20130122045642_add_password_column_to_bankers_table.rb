class AddPasswordColumnToBankersTable < ActiveRecord::Migration
  def change
    add_column :bankers, :password, :string
  end
end
