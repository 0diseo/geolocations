require_relative "../../app/services/geolocations"
require 'rails_helper'


RSpec.describe GeolocationsService do
  describe 'get_ip_from_url' do
    it "it return a ips from url" do
      url = "google.com"
      ips = GeolocationsService.get_ip_from_url(url)
      ips.each do |ip|
        expect(IPAddress.valid? ip).to eq(true)
      end
    end
  end

  describe "get_location_from_ip_ipstack" do
    it "it return a location from ipstack" do
      location = GeolocationsService.get_location_from_ip_ipstack("45.188.165.193")
      expect(location).to be_a(Hash)
      expect(location[:latitude].class).to eq(Float)
      expect(location[:longitude].class).to eq(Float)
    end
  end

  describe "get_location_from_ip" do
    it "it return a location from Geocoder" do
      location = GeolocationsService.get_location_from_ip("45.188.165.193")
      expect(location).to be_a(Hash)
      expect(location[:latitude].class).to eq(Float)
      expect(location[:longitude].class).to eq(Float)
    end
  end

  describe "get_address_from_geolocation" do
    it "it return the address from coordinates" do
      address = GeolocationsService.get_address_from_geolocation(32.7831, -96.8067)
      expect(address).to be_a(Hash)
      expect(address).to include({ "city"=>"Dallas", "state"=>"Texas", "country"=>"United States of America", "country_code"=>"us"})
    end
  end


end