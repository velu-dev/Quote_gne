class ChangeStatusToProcessDetail < ActiveRecord::Migration[5.1]
  def change
     add_column :process_details, :status, :boolean, default: false
  end
end
