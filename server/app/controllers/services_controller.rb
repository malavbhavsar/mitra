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
      if(defined?(@responses['data'][i]['group']['max']))
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

  #Currently uses all passed params, user_id not associated
  def new
    @service = Service.new(params[:service])
    @service.user_id = current_user.id
    @service.save
  end

  def index

    @search = Service.search(params[:search])
    @services = @search.all   # load all matching records
    #@services = Service.all

  end

  def services_by_user
    @search = Service.search(params[:search])
    @services = Service.find_all_by_user_id(current_user.id)
  end
end
