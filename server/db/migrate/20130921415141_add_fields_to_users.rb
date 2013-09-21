class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone, :String
    add_column :users, :description, :String
    add_column :users, :customer_rating, :String
    add_column :users, :service_rating, :String
    add_column :users, :tag, :String
    add_column :users, :location, :String


  end
end
