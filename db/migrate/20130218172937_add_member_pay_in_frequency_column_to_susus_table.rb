class AddMemberPayInFrequencyColumnToSususTable < ActiveRecord::Migration
  def change
    add_column :susus, :member_pay_in_frequency, :string
  end
end
