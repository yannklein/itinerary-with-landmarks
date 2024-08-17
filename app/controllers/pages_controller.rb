class PagesController < ApplicationController
  def home
    @itinerary = Itinerary.find(1)
  end
end
