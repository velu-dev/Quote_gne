class AddCompanyToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :company_name, :string
    add_column :users, :business_details, :string
  end
end
