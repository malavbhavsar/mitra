class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :reviewerid
      t.string :comment
      t.boolean :customerreview
      t.integer :rating
      t.date :reviewdate

      t.timestamps
    end
  end
end
