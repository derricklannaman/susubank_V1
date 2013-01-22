# == Schema Information
#
# Table name: members
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  street_address  :string(255)
#  city            :string(255)
#  state           :string(255)
#  zip             :string(255)
#  home_phone      :string(255)
#  cell_phone      :string(255)
#  member_email    :string(255)
#  user_name       :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Member < ActiveRecord::Base


  has_and_belongs_to_many :susus
end
