class Service < ActiveRecord::Base
  attr_accessible :all_day, :can_travel, :userid, :fee, :location, :max_ppl,
                  :min_ppl, :time_from, :time_to, :picture_url, :name, :brief_description, :long_description

end