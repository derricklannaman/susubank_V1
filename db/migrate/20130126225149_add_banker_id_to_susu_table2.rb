class AddBankerIdToSusuTable2 < ActiveRecord::Migration
  def change
    add_column :susus, :banker_id, :integer
  end
end
