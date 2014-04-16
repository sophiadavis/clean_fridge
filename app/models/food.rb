# == Schema Information
#
# Table name: foods
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fridge_id  :integer
#
# require 'recipe.rb'
class Food < ActiveRecord::Base
  attr_accessible :name, :fridge_id
  
  belongs_to :fridge
  
  validates :name, presence: true
end
