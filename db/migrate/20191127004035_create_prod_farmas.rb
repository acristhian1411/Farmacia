class CreateProdFarmas < ActiveRecord::Migration[5.2]
  def change
    create_table :prod_farmas do |t|
      t.references :producto, foreign_key: true
      t.references :farmaco, foreign_key: true
      t.float :pfar_cant, :default => 0

      t.timestamps
    end
  end
end
