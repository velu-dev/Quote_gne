class CreateUomDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :uom_details do |t|
      t.string :uom_type
      t.float :cost
      t.string :description
      t.belongs_to :currency_type, foreign_key: true

      t.timestamps
    end
  end
end
