class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :phone
      t.string :token
      t.string :code
      t.string :address
      t.string :delivery_address
      t.string :role
      t.string :email
      t.string :plan
      t.datetime :token_expr
      t.datetime :code_expr

      t.timestamps
    end
  end
end
