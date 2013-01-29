class AddColumnSusuIdToMembersTable < ActiveRecord::Migration
  def change
    add_column :members, :susu_id, :integer
  end
end
