class RemoveSusuIdFromSususTable < ActiveRecord::Migration
  def change
    remove_column :susus, :susu_id
  end

end
