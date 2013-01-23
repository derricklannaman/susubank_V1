class AddSusuIdToBankersTableCorrection < ActiveRecord::Migration
  def change
    add_column :bankers, :susu_id, :integer
  end
end
