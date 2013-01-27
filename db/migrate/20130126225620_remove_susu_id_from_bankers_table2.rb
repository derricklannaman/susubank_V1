class RemoveSusuIdFromBankersTable2 < ActiveRecord::Migration
  def change
    remove_column :bankers, :susu_id
  end

end
