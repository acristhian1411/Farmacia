class CreateProductos < ActiveRecord::Migration[5.2]
  def change
    create_table :productos do |t|
      t.references :laboratorio, foreign_key: true
      t.references :rubro, foreign_key: true
      t.string :prod_desc
      t.float :prod_precio
      t.boolean :prod_active, :default => true
      t.string :prod_bcode

      t.timestamps
    end
  end
end
