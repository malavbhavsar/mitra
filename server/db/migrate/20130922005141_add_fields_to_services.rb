class AddFieldsToServices < ActiveRecord::Migration
  def change
    add_column :services, :latitude, :float
    add_column :services, :longitude, :float
    add_column :services, :distance, :float
    add_column :services, :zip_code, :integer
  end
end
