class Review < ActiveRecord::Base
  attr_accessible :comment, :customerreview, :rating, :reviewdate, :reviewerid, :user_id
end
