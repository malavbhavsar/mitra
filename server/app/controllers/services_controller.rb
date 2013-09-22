require 'open-uri'
class ServicesController < InheritedResources::Base
  before_filter :authenticate_user!, :except => [:all]

  #before_filter :get_xola , :only => [:index]

  def get_xola
    @search = Service.search(params[:search])
    @xola_services = Service.find_all_by_user_id(0)
    @xola_services.each do |xola|
      xola.delete
      xola.save
    end

    @experiences = File.read(File.dirname($0) + '/experiences.json')
    @responses = ActiveSupport::JSON.decode(@experiences)

    @responses['data'].count.times do |i|
      @xola_service = Service.new
      @xola_service.picture_url =  "https://dev.xola.com/"+@responses['data'][i]['photo']['src']
      @xola_service.name =  @responses['data'][i]['name']
      @xola_service.brief_description =  @responses['data'][i]['desc']
      @xola_service.long_description =  @responses['data'][i]['desc']
      @xola_service.user_id = 0
      @xola_service.location = @responses['data'][i]['pickupAddress']
      if(defined?(@responses['data'][i]['geo']['lng']))
        @xola_service.latitude = @responses['data'][i]['geo']['lat']
        @xola_service.longitude = @responses['data'][i]['geo']['lng']
      end
     # @xola_service.latitude = @responses['data'][i]['geo']['lng']
      if(defined?(@responses['data'][i]['group']['min']))
        @xola_service.min_ppl = @responses['data'][i]['group']['max']
        @xola_service.max_ppl = @responses['data'][i]['group']['min']
      else
        @xola_service.min_ppl = @responses['data'][i]['groupSize']
        @xola_service.max_ppl = @responses['data'][i]['groupSize']
      end
      @xola_service.fee = @responses['data'][i]['price']
      @xola_service.all_day = false    #TODO: check > 24 or not
      @xola_service.can_travel = false
      if (defined?(@responses['data'][i]['schedules']).first['dates']) # will now return true or false
        @xola_service.time_from = @responses['data'][i]['schedules'].first['dates'].first
        @xola_service.time_to = @responses['data'][i]['schedules'].last['dates'].last
      else
        @xola_service.time_from = ""
        @xola_service.time_to = ""
      end
      @xola_service.save
    end
  end

  def new
    @service = Service.new






    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service }
    end
  end

  def create
    @service = current_user.services.build(params[:service])


    conn = Faraday.new(:url => 'http://dev.virtualearth.net') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    if (!@service.zip_code.nil? and !@service.zip_code.match(/[0-9][0-9][0-9][0-9][0-9]/).nil?)
      response=conn.get '/REST/v1/Locations', { :CountryRegion => 'US', :postalCode => @service.zip_code, :key =>"AoG2_aSmvDSP3ERiCK4ZlKUwGkUNn84Gqafvv_io1ywJZYG5G_WmksnLL6RunKhf" }   # GET /nigiri?name=Maguro

      response = ActiveSupport::JSON.decode(response.body)


      @latitude=response['resourceSets'][0]['resources'][0]['point']['coordinates'][0]
      @longitude=response['resourceSets'][0]['resources'][0]['point']['coordinates'][1]
    else
      @latitude=-58.995311
      @longitude=62.171631
    end

    @service.latitude=@latitude
    @service.longitude=@longitude

    respond_to do |format|
      if @service.save
        format.html { redirect_to user_path(@service.user), notice: 'Service was successfully created.' }
        format.json { redirect_to user_path(@service.user) }
      else
        format.html { render action: "new", error: @service.errors }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @search = Service.search(params[:search])
    @services = @search.all   # load all matching records
    #@services = Service.all
    #credit_card.match(/[0-9]{16}/).nil


    if (!params[:search].nil? and !params[:search][:name_or_location_contains].match(/[0-9][0-9][0-9][0-9][0-9]/).nil? )


      conn = Faraday.new(:url => 'http://dev.virtualearth.net') do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end


      response=conn.get '/REST/v1/Locations', { :CountryRegion => 'US', :postalCode => params[:search][:name_or_location_contains], :key =>"AoG2_aSmvDSP3ERiCK4ZlKUwGkUNn84Gqafvv_io1ywJZYG5G_WmksnLL6RunKhf" }   # GET /nigiri?name=Maguro
      response = ActiveSupport::JSON.decode(response.body)


      @latitude=response['resourceSets'][0]['resources'][0]['point']['coordinates'][0]
      @longitude=response['resourceSets'][0]['resources'][0]['point']['coordinates'][1]

     # p  @latitude
      #p  @longitude
      #puts distance response['resourceSets'][0]['resources'][0]['point']['coordinates'],[42.81010818481445, -73.9510726928711]
      #puts distance [46.3625, 15.114444],[46.055556, 14.508333]
      @services = Service.all

      p "xxxxxxxxx"
      (0..@services.count-1).each do |i|



        @services[i].distance= distance [@latitude,@longitude],[@services[i].latitude, @services[i].longitude]
       # p @services[i].latitude
       # p @services[i].longitude
       # p @services[i].distance
      end


      @services.sort_by! &:distance

      (0..@services.count-1).each do |i|

      end
    end
      # http://dev.virtualearth.net/Locations?CountryRegion=US&postalCode=12345&key=AoG2_aSmvDSP3ERiCK4ZlKUwGkUNn84Gqafvv_io1ywJZYG5G_WmksnLL6RunKhf
      #http://dev.virtualearth.net/REST/v1/Locations?CountryRegion=US&postalCode=94043&key=AoG2_aSmvDSP3ERiCK4ZlKUwGkUNn84Gqafvv_io1ywJZYG5G_WmksnLL6RunKhf
  end

  def services_by_user
    @search = Service.search(params[:search])
    @services = Service.find_all_by_user_id(current_user.id)
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
