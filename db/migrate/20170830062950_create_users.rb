class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email_id
      t.string :address
      t.string :mobile_no
      t.string :username
      t.string :password
      t.belongs_to :user_type, foreign_key: true
      t.belongs_to :user_role, foreign_key: true

      t.timestamps
    end
  end
end
