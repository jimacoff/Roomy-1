class AddFirstAndSecondNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :second_name, :string
  end
end
