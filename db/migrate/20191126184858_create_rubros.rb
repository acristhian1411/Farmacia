class CreateRubros < ActiveRecord::Migration[5.2]
  def change
    create_table :rubros do |t|
      t.string :rubro_desc
      t.integer :rubro_iva
      t.boolean :rubro_active, :default => true

      t.timestamps
    end
  end
end
