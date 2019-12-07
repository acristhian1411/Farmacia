class CreateTmovCajas < ActiveRecord::Migration[5.2]
  def change
    create_table :tmov_cajas do |t|
      t.string :tmov_caja
      t.boolean :tmov_es

      t.timestamps
    end
  end
end
