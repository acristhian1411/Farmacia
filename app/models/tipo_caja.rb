# == Schema Information
#
# Table name: tipo_cajas
#
#  id           :bigint           not null, primary key
#  tcaja_active :boolean          default(TRUE)
#  tcaja_desc   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class TipoCaja < ApplicationRecord

  # Todos los Inactivos
    scope :inactivo, -> {
  where('tcaja_active != ?', true)
  }
  # Todos los activos
  scope :activo, -> {
  where(:tcaja_active => true)
  }
  # Todos los registros
  scope :todos, -> {
  all
  }

end
