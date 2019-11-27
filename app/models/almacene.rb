# == Schema Information
#
# Table name: almacenes
#
#  id          :bigint           not null, primary key
#  alma_active :boolean          default(TRUE)
#  alma_desc   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Almacene < ApplicationRecord

  # Todos los Inactivos
    scope :inactivo, -> {
  where('alma_active != ?', true)
  }
  # Todos los activos
  scope :activo, -> {
  where(:alma_active => true)
  }
  # Todos los registros
  scope :todos, -> {
  all
  }


end
