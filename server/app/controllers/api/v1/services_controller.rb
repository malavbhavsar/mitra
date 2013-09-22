class Api::V1::ServicesController < Api::ApiController
 # before_filter :authenticate_user!, :except => [:all]
  def services_by_user
    @services = Service.find_all_by_user_id(params[:id])
    render json: @services
  end

  def index
    @services = Service.all
    render json: @services

  end

  #TODO: Display the service
  def show
    @service = Service.find_by_id(params[:id])
    render json: @service

  end

  def new
    @service = Service.new
    render json: @service

  end


  def create
    @service = Service.new(params[:service])
      if @service.save
        render json: @service, status: :created
        #redirect_to events_path
      else
        render json: @service.errors, status: :unprocessable_entity
      end

  end


end
