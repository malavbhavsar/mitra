class Api::V1::ReviewsController < Api::ApiController
  #doorkeeper_for :all

  def show
    @review = Review.find_by_id(params[:id])



    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @review }
    end

  end


  def index
    @reviews = Review.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews }
    end

  end

  def reviews_by_user


    @reviews = Review.find_by_id(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews }
    end

  end


  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|

      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
        #redirect_to events_path
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end

  end

end
