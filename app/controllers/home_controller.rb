class HomeController < ApplicationController
  def index
    @places = user_signed_in? ?
        current_user.places.where(cleared: false) : Place.none
  end
end
