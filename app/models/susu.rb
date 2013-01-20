class Susu < ActiveRecord::Base


  has_and_belongs_to_many :members
  belongs_to :banker
end