# == Schema Information
#
# Table name: susus
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  num_of_members   :integer
#  length           :integer
#  pay_out_rotation :string(255)
#  pay_in_amount    :decimal(, )
#  pay_out_amount   :decimal(, )
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Susu < ActiveRecord::Base

  belongs_to :banker
  has_and_belongs_to_many :members
end
