class CreateUserRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_roles do |t|
      t.string :name
      t.string : 

      t.timestamps
    end
  end
end
