class CreateQuoteDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :quote_details do |t|
      t.string :quote_no
      t.float :cost
      t.float :discount
      t.float :total_cost
      t.boolean :status
      t.belongs_to :user, foreign_key: true
      t.belongs_to :currency_type, foreign_key: true
      t.belongs_to :project_detail, foreign_key: true

      t.timestamps
    end
  end
end
