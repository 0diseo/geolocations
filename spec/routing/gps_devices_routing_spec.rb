require "rails_helper"

RSpec.describe GpsDevicesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/gps_devices").to route_to("gps_devices#index")
    end

    it "routes to #show" do
      expect(get: "/gps_devices/1").to route_to("gps_devices#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/gps_devices").to route_to("gps_devices#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/gps_devices/1").to route_to("gps_devices#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/gps_devices/1").to route_to("gps_devices#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/gps_devices/1").to route_to("gps_devices#destroy", id: "1")
    end
  end
end
