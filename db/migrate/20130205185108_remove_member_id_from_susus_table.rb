class RemoveMemberIdFromSususTable < ActiveRecord::Migration
  def change
    remove_column :susus, :member_id
  end

end
