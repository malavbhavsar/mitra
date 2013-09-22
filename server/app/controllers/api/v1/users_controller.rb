class Api::V1::UsersController < Api::ApiController
  #doorkeeper_for :all

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

    # expires_in 5.seconds
    # fresh_when @user


    #
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end

  end


  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end

  end
end
