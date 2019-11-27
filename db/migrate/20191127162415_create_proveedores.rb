class CreateProveedores < ActiveRecord::Migration[5.2]
  def change
    create_table :proveedores do |t|
      t.string :prov_nombre
      t.string :prov_ruc
      t.string :prov_telefono
      t.string :prov_direc
      t.string :prov_email
      t.boolean :prov_active, :default => true

      t.timestamps
    end
  end
end
