class Api::V1::ServicesController < Api::ApiController
 # before_filter :authenticate_user!, :except => [:all]
  def services_by_user
    @services = Service.find_all_by_user_id(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @services }
    end
  end

  def index
    @services = Service.all


    render json: @services
  end

  #TODO: Display the service
  def show
    @service = Service.find_by_id(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @service }
    end
  end

  def new
    @service = Service.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service }
      format.xml { render xml: @service }
    end
  end


  def create
    @service = Service.new(params[:service])
    respond_to do |format|

      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render json: @service, status: :created}
        format.xml { render xml: @service, status: :created }
        format.js
        #redirect_to events_path
      else
        format.html { render action: "new" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
        format.xml { render xml: @service.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


end
