class CreateProjectDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :project_details do |t|
      t.string :project_name
      t.string :description
      t.boolean :status
      t.belongs_to :user, foreign_key: true
      t.belongs_to :project_type, foreign_key: true
      t.timestamps
    end
  end
end
