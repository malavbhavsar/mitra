class ServicesController < InheritedResources::Base
 # before_filter :authenticate_user!

  def new
    @service = Service.new(params[:service])
    @service.save
  end
end
