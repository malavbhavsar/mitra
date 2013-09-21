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
end
