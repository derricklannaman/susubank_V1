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
#  banker_id        :integer
#  member_id        :integer
#

class Susu < ActiveRecord::Base

  has_many :members
  belongs_to :banker
end
