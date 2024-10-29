module GeolocationsService
  IPSTACKK_API_KEY = Rails.application.credentials.ipstack_api_key
  def self.get_ip_from_url(url)
    Resolv.getaddresses(url&.gsub(/https:\/\/|http:\/\//, "") || "")
  end

  def self.get_location_from_ip_ipstack(ip_address)
    url = "https://api.ipstack.com/#{ip_address}?access_key=#{IPSTACKK_API_KEY}"
    response = RestClient.get(url)
    results = JSON.parse(response.to_str)
    {latitude: results["latitude"], longitude: results["longitude"]}
  end

  def self.get_location_from_ip(ip_address)
    results = Geocoder.search(ip_address).first
    {latitude: results.coordinates[0], longitude: results.coordinates[1] }
  end

  def self.get_address_from_ip(ip_address)

  end

  def self.get_address_from_geolocation(geolocation)
    results = Geocoder.search([geolocation.latitude, geolocation.longitude])

  end

end