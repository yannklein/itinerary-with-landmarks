class ItinerariesController < ApplicationController
  def create
    @itinerary = Itinerary.new(itinerary_params)
    if @itinerary.save
      redirect_to "/"
    else
      render "pages/home"
    end
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:name, waypoints: [])
  end
end
