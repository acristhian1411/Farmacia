# == Schema Information
#
# Table name: sectores
#
#  id          :bigint           not null, primary key
#  sect_active :boolean          default(TRUE)
#  sect_desc   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  almacene_id :bigint
#
# Indexes
#
#  index_sectores_on_almacene_id  (almacene_id)
#
# Foreign Keys
#
#  fk_rails_...  (almacene_id => almacenes.id)
#

class Sectore < ApplicationRecord
  belongs_to :almacene

  # Todos los Inactivos
    scope :inactivo, -> {
  where('sect_active != ?', true)
  }
  # Todos los activos
  scope :activo, -> {
  where(:sect_active => true)
  }
  # Todos los registros
  scope :todos, -> {
  all
  }




end
