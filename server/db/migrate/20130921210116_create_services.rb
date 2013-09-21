class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :picture_url
      t.string :name
      t.string :brief_description
      t.string :long_description
      t.string :userid
      t.string :location
      t.integer :min_ppl
      t.integer :max_ppl
      t.decimal :fee
      t.boolean :all_day
      t.boolean :can_travel
      t.datetime :time_from
      t.datetime :time_to
      t.timestamps
    end
  end
end
