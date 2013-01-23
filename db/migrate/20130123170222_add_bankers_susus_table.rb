class AddBankersSususTable < ActiveRecord::Migration
  def change
    create_table :bankers_susus, :id => false do |t|
      t.integer :banker_id
      t.integer :susu_id
    end
      add_index :bankers_susus, [:banker_id, :susu_id]
  end

end
