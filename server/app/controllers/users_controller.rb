class UsersController < InheritedResources::Base

  def show
    @user = User.find_by_id(params[:id])

    @services = Service.find_all_by_user_id(current_user.id)
    @reviews = Review.where(:customerreview => true).find_all_by_user_id(current_user.id)



    @rating_sum = 0

    @reviews.each do |review|
      @rating_sum = @rating_sum + review.rating
    end


    if (@reviews.count!=0)
      @rating=@rating_sum/@reviews.count
    else
      @rating=0
    end

    @user.update_attribute(:service_rating, @rating)


    if @user.nil?
      render_error(
          :resource_not_found,
          "Not Found",
          "Requested user does not exist."
      )
      return
    end

    if @user.uid
      hash = current_user.facebook.get_object(@user.uid)
      logger.debug "facebook user: #{hash}"
      @user.facebook_user = FacebookUser.new(hash)
    end


  end



end
