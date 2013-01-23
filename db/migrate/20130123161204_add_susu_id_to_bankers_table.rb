class AddSusuIdToBankersTable < ActiveRecord::Migration
  def change
    add_column :susus, :susu_id, :integer
  end
end
