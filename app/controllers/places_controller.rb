class PlacesController < ApplicationController
  respond_to :json

  def new
    @place = Post.new
  end

  def create
    @place = Place.new(params[:place].permit(:name, :lat, :lng, :reference))
    if @place.save!
      render json: @place
    else
      render :text => "FUCK"
    end
  end

  def update
    @place = Place.find(params[:id])
   
    @place.done = !@place.done

    @place.save()
  end

  def index
    @places = Place.all
  end
end
