# == Schema Information
#
# Table name: rubros
#
#  id           :bigint           not null, primary key
#  rubro_active :boolean          default(TRUE)
#  rubro_desc   :string
#  rubro_iva    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class RubroTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
