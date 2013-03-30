class AddProviderColumnToBankersTable < ActiveRecord::Migration
  def change
    add_column :bankers, :provider, :string
  end
end
