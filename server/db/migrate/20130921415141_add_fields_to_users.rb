class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string
    add_column :users, :description, :string
    add_column :users, :customer_rating, :string
    add_column :users, :service_rating, :string
    add_column :users, :tag, :string
    add_column :users, :location, :string
  end
end
