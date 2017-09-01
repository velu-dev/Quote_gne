class AddColoumInToQuoteDetailsForReferance < ActiveRecord::Migration[5.1]
  def change
  
  	add_reference :quote_details, :project_type, foreign_key: true
end
end
