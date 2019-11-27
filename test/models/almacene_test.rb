# == Schema Information
#
# Table name: almacenes
#
#  id          :bigint           not null, primary key
#  alma_active :boolean          default(TRUE)
#  alma_desc   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class AlmaceneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
