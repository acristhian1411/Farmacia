# == Schema Information
#
# Table name: laboratorios
#
#  id         :bigint           not null, primary key
#  lab_active :boolean          default(TRUE)
#  lab_desc   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class LaboratorioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
