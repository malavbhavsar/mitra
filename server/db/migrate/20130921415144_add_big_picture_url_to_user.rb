class AddBigPictureUrlToUser < ActiveRecord::Migration
  def change
    add_column :users, :big_picture_url, :string
  end
end
