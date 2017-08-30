class CreateCurrencyTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :currency_types do |t|
      t.string :type_name
      t.string :description

      t.timestamps
    end
  end
end
