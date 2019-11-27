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

class Laboratorio < ApplicationRecord

# Todos los Inactivos
  scope :inactivo, -> {
where('lab_active != ?', true)
}
# Todos los activos
scope :activo, -> {
where(:lab_active => true)
}
# Todos los registros
scope :todos, -> {
all
}



end
