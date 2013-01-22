# == Schema Information
#
# Table name: bankers
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  banker_email    :string(255)
#  user_name       :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Banker < ActiveRecord::Base

  has_secure_password
  has_and_belongs_to_many :susus
end
