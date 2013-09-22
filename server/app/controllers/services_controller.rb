class ServicesController < InheritedResources::Base
  before_filter :authenticate_user!, :except => [:all]

  #Currently uses all passed params, user_id not associated
  def new
    @service = Service.new(params[:service])
    @service.user_id = current_user.id
    @service.save
  end

  def index
    @services = Service.all
  end

###
  def services_by_user
    @services = Service.find_all_by_user_id(current_user.id)
  end
end
