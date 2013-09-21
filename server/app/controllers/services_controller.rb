class ServicesController < InheritedResources::Base
 # before_filter :authenticate_user!

  #Currently uses all passed params, userid not associated
  def new
    @service = Service.new(params[:service])
    @service.save
  end
end
