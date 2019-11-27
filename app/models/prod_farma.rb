# == Schema Information
#
# Table name: prod_farmas
#
#  id          :bigint           not null, primary key
#  pfar_cant   :float            default(0.0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  farmaco_id  :bigint
#  producto_id :bigint
#
# Indexes
#
#  index_prod_farmas_on_farmaco_id   (farmaco_id)
#  index_prod_farmas_on_producto_id  (producto_id)
#
# Foreign Keys
#
#  fk_rails_...  (farmaco_id => farmacos.id)
#  fk_rails_...  (producto_id => productos.id)
#

class ProdFarma < ApplicationRecord
  belongs_to :producto
  belongs_to :farmaco
end
