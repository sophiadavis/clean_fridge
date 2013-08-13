# == Schema Information
#
# Table name: fridges
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Fridge < ActiveRecord::Base
  attr_accessible :name, :user_id
  
  belongs_to :user
  has_many :foods

  validates :name, presence: true
  validates :user_id, presence: true
end
