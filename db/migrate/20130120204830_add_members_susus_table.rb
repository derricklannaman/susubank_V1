class AddMembersSususTable < ActiveRecord::Migration
  def change
    create_table :members_susus, :id => false do |t|
      t.integer :member_id
      t.integer :susu_id
    end
    add_index :members_susus, [:member_id, :susu_id]
  end
end
