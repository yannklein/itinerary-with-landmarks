class LandmarksController < ApplicationController
  def create
    @itinerary = Itinerary.find(params[:itinerary_id])
    @landmark = Landmark.new(landmark_params)
    @landmark.itinerary = @itinerary
    if @landmark.save
      respond_to do |format|
        format.text { render partial: "landmarks/landmark_card", locals: {landmark: @landmark}, formats: [:html] }
      end
    end
  end

  private

  def landmark_params
    params.require(:landmark).permit(:name, :latitude, :longitude)
  end
end
