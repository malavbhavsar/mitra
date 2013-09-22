class Service < ActiveRecord::Base
  attr_accessible :all_day, :can_travel, :user_id, :fee, :location, :max_ppl,
                  :min_ppl, :time_from, :time_to, :picture_url, :name, :brief_description, :long_description, :zip_code, :latitude, :longitude
  belongs_to :user
end