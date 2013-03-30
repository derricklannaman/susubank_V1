class AddUidColumnToBankersTable < ActiveRecord::Migration
  def change
    add_column :bankers, :uid, :string
  end
end
