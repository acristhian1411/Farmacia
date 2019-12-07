# == Schema Information
#
# Table name: tmov_cajas
#
#  id         :bigint           not null, primary key
#  tmov_caja  :string
#  tmov_es    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TmovCaja < ApplicationRecord
end
