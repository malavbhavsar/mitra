class ServicesController < InheritedResources::Base
  before_filter :authenticate_user!, :except => [:all]

  #Currently uses all passed params, userid not associated
  def new
    @service = Service.new(params[:service])
    @service.userid = current_user.id
    @service.save
  end

  def index
    @services = Service.find_all_by_userid(current_user.id)
  end

  def all
    @services = Service.all
  end
end
