class AddMemberIdColumnToSususTable < ActiveRecord::Migration
  def change
    add_column :susus, :member_id, :integer
  end
end
