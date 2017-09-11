class CreateServiceDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :service_details do |t|
      t.string :service_name
      t.string :service_id
      t.belongs_to :process_detail, foreign_key: true
      t.integer :project_detail, array: true
      
      t.timestamps
    end
  end
end
