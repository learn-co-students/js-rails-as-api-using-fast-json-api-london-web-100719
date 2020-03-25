class SightingsController < ApplicationController

  def index
    sighting = Sighting.all
    options = {
      include: [:bird, :location]
    }
    render json: SightingSerializer.new(sighting, options)
  end

  def show
    sighting = Sighting.find(params[:id])
    render json: SightingSerializer.new(sighting)
  end
end