class RemoveBankerIdFromSususTable < ActiveRecord::Migration
  # added bankers_susus join instead

  def change
    remove_column :susus, :banker_id
  end
end
