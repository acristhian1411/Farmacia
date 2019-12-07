class CreateCajas < ActiveRecord::Migration[5.2]
  def change
    create_table :cajas do |t|
      t.references :tipo_caja, foreign_key: true
      t.references :tmov_caja, foreign_key: true
      t.date :caja_fecha
      t.float :caja_monto
      t.string :caja_desc
      t.boolean :caja_es

      t.timestamps
    end
  end
end
