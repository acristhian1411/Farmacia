class CreateSectores < ActiveRecord::Migration[5.2]
  def change
    create_table :sectores do |t|
      t.string :sect_desc
      t.boolean :sect_active, :default => true
      t.references :almacene, foreign_key: true

      t.timestamps
    end
  end
end
