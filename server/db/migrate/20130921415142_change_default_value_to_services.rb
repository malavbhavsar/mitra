class ChangeDefaultValueToServices < ActiveRecord::Migration
  def change
    change_column :services, :picture_url, :string, :default => "cmu.jpg"
  end
end
