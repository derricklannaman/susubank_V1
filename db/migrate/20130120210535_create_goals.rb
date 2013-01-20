class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title
      t.text :description
      t.decimal :goal_amount
      t.integer :member_id

      t.timestamps
    end
  end
end
