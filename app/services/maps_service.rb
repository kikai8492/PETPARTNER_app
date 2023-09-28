class MapsService
  # ... other methods ...

  def self.find_nearby_places(midpoint, type, api_key)
    places_api_url = ENV['Map_API'] # Corrected from Map_API
    uri = URI(places_api_url)
    uri.query = URI.encode_www_form({
      location: "#{midpoint[:latitude]},#{midpoint[:longitude]}",
      radius: 1000,
      type: type,
      key: api_key
    })

    response = Net::HTTP.get_response(uri)
    data = JSON.parse(response.body)

    first_place = data['results']&.first
    return nil unless first_place

    {
      name: first_place['name'],
      latitude: first_place['geometry']['location']['lat'],
      longitude: first_place['geometry']['location']['lng']
    }
  end

  def coordinates
    if results.present?
      lat = results.first.latitude
      lon = results.first.longitude
      { latitude: lat, longitude: lon }
    else
      nil
    end
  end
  
  
  def self.get_midpoint_on_route(user1, user2, _api_key) # Note: _api_key is unused for now
    puts "User1: #{user1.inspect}"
    puts "User2: #{user2.inspect}"
    
    results = Geocoder.search(full_address)
    binding.pry
    # coords_user1 = user1.coordinates
    # coords_user2 = user2.coordinates

    coords_user1 = user1.[postal_code, prefecture, municipality, street_address].compact.join(', ')
    coords_user2 = user2.[postal_code, prefecture, municipality, street_address].compact.join(', ')
    
    midpoint_lat = (coords_user1[:latitude] + coords_user2[:latitude]) / 2.0
    midpoint_lon = (coords_user1[:longitude] + coords_user2[:longitude]) / 2.0
    
    # For this example, the distance is not calculated but can be added as needed.
    {
      midpoint: { latitude: midpoint_lat, longitude: midpoint_lon },
      distance: nil
    }
  end
  
  def full_address
    [postal_code, prefecture, municipality, street_address].compact.join(', ')
  end
  
end
