# == Schema Information
#
# Table name: farmacos
#
#  id           :bigint           not null, primary key
#  farma_active :boolean          default(TRUE)
#  farma_desc   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class FarmacoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
