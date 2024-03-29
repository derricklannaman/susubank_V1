# == Schema Information
#
# Table name: susus
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  num_of_members          :integer
#  length                  :integer
#  pay_out_rotation        :string(255)
#  pay_in_amount           :decimal(, )
#  pay_out_amount          :decimal(, )
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  banker_id               :integer
#  member_pay_in_frequency :string(255)
#

class Susu < ActiveRecord::Base

  has_many :members, dependent: :destroy
  belongs_to :banker

  validates :name, presence: true

  def self.most_recent_first
    order('created_at DESC')
  end

end
