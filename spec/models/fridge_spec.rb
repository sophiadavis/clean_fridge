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

require 'spec_helper'

describe Fridge do
  pending "add some examples to (or delete) #{__FILE__}"
end
