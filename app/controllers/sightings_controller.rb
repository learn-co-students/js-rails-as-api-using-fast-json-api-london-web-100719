class SightingsController < ApplicationController
  def index
    sightings = Sighting.all
    # render json: SightingSerializer.new(sightings)
    render json: SightingSerializer.new(sightings).to_serialized_json
  end
  
  def show
    sighting = Sighting.find(params[:id])

    # options = {
    #   include: [:bird, :location]
    # }
    # render json: SightingSerializer.new(sighting, options)
    render json: SightingSerializer.new(sighting).to_serialized_json
  end
end