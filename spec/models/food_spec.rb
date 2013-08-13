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

require 'spec_helper'

describe Food do
  pending "add some examples to (or delete) #{__FILE__}"
end
