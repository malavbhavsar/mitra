class Api::V1::ReviewsController < Api::ApiController
  #doorkeeper_for :all

  def show
    @review = Review.find_by_id(params[:id])




    render json: @review

  end


  def index
    @reviews = Review.all

    render json: @reviews


  end

  def reviews_by_user


    @reviews = Review.find_by_user_id(params[:id])

    render json: @reviews


  end


  # POST /events
  # POST /events.json
  def create
    @review = Review.new(params[:review])


      if @review.save
        render json: @review , status: :created, location: @event
        #redirect_to events_path
      else
        render json: @review .errors, status: :unprocessable_entity
      end


  end

end
