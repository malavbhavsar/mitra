class ReviewsController < InheritedResources::Base
  ####
  def reviews_by_user
    @reviews = Review.find_all_by_user_id(current_user.id)
  end
end
