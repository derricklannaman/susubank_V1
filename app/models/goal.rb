# == Schema Information
#
# Table name: goals
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  goal_amount :decimal(, )
#  member_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Goal < ActiveRecord::Base

  belongs_to :member
end
