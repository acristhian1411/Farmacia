class CreateProdSectores < ActiveRecord::Migration[5.2]
  def change
    create_table :prod_sectores do |t|
      t.references :sectore, foreign_key: true
      t.references :producto, foreign_key: true

      t.timestamps
    end
  end
end
