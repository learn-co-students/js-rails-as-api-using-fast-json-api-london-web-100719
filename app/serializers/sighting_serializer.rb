class SightingSerializer
  include FastJsonapi::ObjectSerializer
  attributes :created_at
  belongs_to :bird
  belongs_to :location

  def initialize(sighting)
    @sighting = sighting
  end
  
  def to_serialized_json
    options = {
      include: {
        bird: {
          only: [:name, :species]
        },
        location: {
          only: [:latitude, :longitude]
        }
      },
      except: [:updated_at, :bird_id, :location_id],
    }
    @sighting.to_json(options)
  end
end
