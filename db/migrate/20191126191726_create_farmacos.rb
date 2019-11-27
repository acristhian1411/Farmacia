class CreateFarmacos < ActiveRecord::Migration[5.2]
  def change
    create_table :farmacos do |t|
      t.string :farma_desc
      t.boolean :farma_active, :default => true

      t.timestamps
    end
  end
end
