class CreateTipoCajas < ActiveRecord::Migration[5.2]
  def change
    create_table :tipo_cajas do |t|
      t.string :tcaja_desc
      t.boolean :tcaja_active, :default => true

      t.timestamps
    end
  end
end
