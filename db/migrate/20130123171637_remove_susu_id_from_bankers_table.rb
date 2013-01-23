class RemoveSusuIdFromBankersTable < ActiveRecord::Migration
  # added bankers_susus join instead
  def change
    remove_column :bankers, :susu_id
  end

end
