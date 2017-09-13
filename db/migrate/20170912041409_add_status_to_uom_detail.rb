class AddStatusToUomDetail < ActiveRecord::Migration[5.1]
  def change
   add_column :uom_details, :status, :boolean
  end
end
