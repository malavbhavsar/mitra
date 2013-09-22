class UsersController < InheritedResources::Base

  def show
    @user = User.find_by_id(params[:id])
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
    @services = Service.find_all_by_user_id(current_user.id)
    @reviews = Review.find_all_by_user_id(current_user.id)
  end

  def new_review
  end

end
