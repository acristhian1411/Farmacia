# == Schema Information
#
# Table name: productos
#
#  id             :bigint           not null, primary key
#  prod_active    :boolean          default(TRUE)
#  prod_bcode     :string
#  prod_desc      :string
#  prod_precio    :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  laboratorio_id :bigint
#  rubro_id       :bigint
#
# Indexes
#
#  index_productos_on_laboratorio_id  (laboratorio_id)
#  index_productos_on_rubro_id        (rubro_id)
#
# Foreign Keys
#
#  fk_rails_...  (laboratorio_id => laboratorios.id)
#  fk_rails_...  (rubro_id => rubros.id)
#

require 'test_helper'

class ProductoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
