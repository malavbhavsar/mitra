class Review < ActiveRecord::Base
  attr_accessible :comment, :customerreview, :rating, :reviewdate, :reviewerid, :userid
end
