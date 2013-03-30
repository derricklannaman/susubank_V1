# == Schema Information
#
# Table name: bankers
#
#  id               :integer          not null, primary key
#  first_name       :string(255)
#  last_name        :string(255)
#  banker_email     :string(255)
#  user_name        :string(255)
#  password_digest  :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  password         :string(255)
#  provider         :string(255)
#  uid              :string(255)
#  oauth_token      :string(255)
#  oauth_expires_at :datetime
#

class Banker < ActiveRecord::Base

  has_secure_password
  has_many :susus, dependent: :destroy


  validates :banker_email, presence: true

  # def self.from_omniauth(auth)
  #   where(auth.slice(:provider, :uid)).first_or_initialize.tap do |banker|
  #     banker.provider = auth.provider
  #     banker.uid = auth.uid
  #     banker.first_name = auth.info.name
  #     banker.oauth_token = auth.credentials.token
  #     banker.oauth_expires_at = Time.at(auth.credentials.expires_at)
  #     banker.save!
  #   end
  # end
end
