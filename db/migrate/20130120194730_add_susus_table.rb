class AddSususTable < ActiveRecord::Migration
  def change
    create_table :susus do |t|
      t.string :name
      t.integer :num_of_members
      t.integer :length
      t.string :pay_out_rotation
      t.decimal :pay_in_amount
      t.decimal :pay_out_amount

      t.timestamps
    end
  end


end
