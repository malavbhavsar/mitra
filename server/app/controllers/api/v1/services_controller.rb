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



  def by_location

    @latitude=params[:latitude].to_d
    @longitude=params[:longitude].to_d



    @services = Service.all


    (0..@services.count-1).each do |i|

      @services[i].distance= distance [@latitude,@longitude],[@services[i].latitude, @services[i].longitude]
      # p @services[i].latitude
      # p @services[i].longitude
      # p @services[i].distance
    end


    @services.sort_by! &:distance


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




  def distance a, b
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters

    dlon_rad = (b[1]-a[1]) * rad_per_deg  # Delta, converted to rad
    dlat_rad = (b[0]-a[0]) * rad_per_deg

    lat1_rad, lon1_rad = a.map! {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = b.map! {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math.asin(Math.sqrt(a))

    rm * c/ 1609.34 # Delta in miles
  end

end
