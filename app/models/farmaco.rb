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

class Farmaco < ApplicationRecord

  # Todos los Inactivos
    scope :inactivo, -> {
  where('farma_active != ?', true)
  }
  # Todos los activos
  scope :activo, -> {
  where(:farma_active => true)
  }
  # Todos los registros
  scope :todos, -> {
  all
  }



end
