# == Schema Information
#
# Table name: sectores
#
#  id          :bigint           not null, primary key
#  sect_active :boolean          default(TRUE)
#  sect_desc   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  almacene_id :bigint
#
# Indexes
#
#  index_sectores_on_almacene_id  (almacene_id)
#
# Foreign Keys
#
#  fk_rails_...  (almacene_id => almacenes.id)
#

require 'test_helper'

class SectoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
