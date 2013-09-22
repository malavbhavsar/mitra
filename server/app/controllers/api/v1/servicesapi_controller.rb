class Api::V1::ServicesapiController < Api::ApiController
 # before_filter :authenticate_user!, :except => [:all]
  def user
    @services = Service.find_all_by_userid(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @services }
    end
  end

  def index
    @services = Service.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @services }
    end
  end

  #TODO: Display the service
  def show
    @service = Service.find_by_id(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @service }
    end
  end

end
