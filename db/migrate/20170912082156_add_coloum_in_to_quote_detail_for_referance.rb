class AddColoumInToQuoteDetailForReferance < ActiveRecord::Migration[5.1]
  def change
      #add_reference :quote_details, :service_detail, foreign_key: true
      add_column :quote_details, :service_detail, :integer, array: true
  end
end
