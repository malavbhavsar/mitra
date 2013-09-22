class ReviewsController < InheritedResources::Base
  ####
  def reviews_by_user
    @reviews = Review.find_all_by_user_id(current_user.id)
  end



  def create

    @review = Review.new(params[:review])
    @review.customerreview=true
    @review.save
    redirect_to(user_path(@review.user_id))
  end
end
