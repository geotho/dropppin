class PlacesController < ApplicationController
  respond_to :json

  def create
    @place = current_user.places
        .build(params[:place].permit(:name, :lat, :lng, :reference, :address))
    @place.done = false
    @place.cleared = false
    respond_to do |format|
      if @place.save!
        format.html { render :partial => "place", :locals => {:place => @place} }
      else
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def toggle_done
    @place = current_user.places.find(params[:id])

    @place.done = !@place.done

    if @place.save!
      head :no_content
    else
      render status: :internal_server_error
    end
  end

  def clear_done
    @places = current_user.places.where(done: true).update_all(cleared: true)

    head :no_content
  end

  def clear_all
    @places = current_user.places.update_all(cleared: true)

    head :no_content
  end
end
