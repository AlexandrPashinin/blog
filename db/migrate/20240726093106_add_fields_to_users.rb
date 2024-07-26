class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string ,null: false, default: ""
    add_column :users, :last_name, :string, null: false, default: ""
    add_column :users, :nik_name, :string,   null: true
  end
end
