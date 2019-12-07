# == Schema Information
#
# Table name: cajas
#
#  id           :bigint           not null, primary key
#  caja_desc    :string
#  caja_es      :boolean
#  caja_fecha   :date
#  caja_monto   :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  tipo_caja_id :bigint
#  tmov_caja_id :bigint
#
# Indexes
#
#  index_cajas_on_tipo_caja_id  (tipo_caja_id)
#  index_cajas_on_tmov_caja_id  (tmov_caja_id)
#
# Foreign Keys
#
#  fk_rails_...  (tipo_caja_id => tipo_cajas.id)
#  fk_rails_...  (tmov_caja_id => tmov_cajas.id)
#

class Caja < ApplicationRecord
  belongs_to :tipo_caja
  belongs_to :tmov_caja

  # Todos los Inactivos
    scope :inactivo, -> {
  where('caja_es != ?', true)
  }
  # Todos los activos
  scope :activo, -> {
  where(:caja_es => true)
  }
  # Todos los registros
  scope :todos, -> {
  all
  }

end
