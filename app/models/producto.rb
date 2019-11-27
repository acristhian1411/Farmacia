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

class Producto < ApplicationRecord
  belongs_to :laboratorio
  belongs_to :rubro
  has_many :prod_farma
  has_many :prod_sectore

accepts_nested_attributes_for :prod_farma, :prod_sectore

  # Todos los Inactivos
    scope :inactivo, -> {
  where('prod_active != ?', true)
  }
  # Todos los activos
  scope :activo, -> {
  where(:prod_active => true)
  }
  # Todos los registros
  scope :todos, -> {
  all
  }



end
