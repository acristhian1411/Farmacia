# == Schema Information
#
# Table name: prod_sectores
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  producto_id :bigint
#  sectore_id  :bigint
#
# Indexes
#
#  index_prod_sectores_on_producto_id  (producto_id)
#  index_prod_sectores_on_sectore_id   (sectore_id)
#
# Foreign Keys
#
#  fk_rails_...  (producto_id => productos.id)
#  fk_rails_...  (sectore_id => sectores.id)
#

require 'test_helper'

class ProdSectoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
