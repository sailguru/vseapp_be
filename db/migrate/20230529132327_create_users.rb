class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :phone
      t.integer :age
      t.string :address
      t.string :delivery_address
      t.string :role
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
