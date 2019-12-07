# == Schema Information
#
# Table name: proveedores
#
#  id            :bigint           not null, primary key
#  prov_active   :boolean          default(TRUE)
#  prov_direc    :string
#  prov_email    :string
#  prov_nombre   :string
#  prov_ruc      :string
#  prov_telefono :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Proveedore < ApplicationRecord

  # Todos los Inactivos
    scope :inactivo, -> {
  where('prov_active != ?', true)
  }
  # Todos los activos
  scope :activo, -> {
  where(:prov_active => true)
  }
  # Todos los registros
  scope :todos, -> {
  all
  }



end
