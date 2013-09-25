class HomeController < ApplicationController
  def index
    @places = Place.all
    @places.each do |place|
      puts place.name
    end
  end
end
