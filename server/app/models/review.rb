class Review < ActiveRecord::Base
  attr_accessible :comment, :customerreview, :rating, :reviewdate, :reviewerid, :user_id
  belongs_to :user , :foreign_key => "reviewerid"

end
