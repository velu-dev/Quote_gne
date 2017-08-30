class CreateProcessDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :process_details do |t|
      t.string :process_name
      t.integer :parent_process_id
      t.float :cost
      t.integer :project_detail, array: true
      t.belongs_to :currency_type, foreign_key: true
      t.belongs_to :uom_detail, foreign_key: true
      t.timestamps
    end
  end
end
