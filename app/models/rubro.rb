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

class Rubro < ApplicationRecord

  # Todos los Inactivos
    scope :inactivo, -> {
  where('rubro_active != ?', true)
  }
  # Todos los activos
  scope :activo, -> {
  where(:rubro_active => true)
  }
  # Todos los registros
  scope :todos, -> {
  all
  }



end
