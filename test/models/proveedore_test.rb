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

require 'test_helper'

class ProveedoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
