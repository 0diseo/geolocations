require_relative "../services/geolocations"

class GeolocationsController < ApplicationController
  before_action :set_geolocation, only: %i[ show update destroy ]
  before_action :authenticate_user!, except: %I[ create ]

  # GET /geolocations
  def index
    @geolocations = params[:gps_device_id] ? current_user.gps_devices.find(params[:gps_device_id]).geolocations :
                      current_user.geolocations

    geolocations = @geolocations.map do |geolocation|
      address = GeolocationsService.get_address_from_geolocation(geolocation.latitude, geolocation.longitude)
      geolocation.attributes.merge(address: address)
    end
    render json: geolocations
  end

  # GET /geolocations/1
  def show
    address = GeolocationsService.get_address_from_geolocation(@geolocation.latitude, @geolocation.longitude)
    render json: @geolocation.attributes.merge(address: address)
  end

  # POST /geolocations
  def create
    @geolocations = geolocation_params.map{ |params| Geolocation.new(params) }

    if @geolocations.all?{ |geolocation| geolocation.valid? }
      @geolocations.each(&:save)
      render json: @geolocations, status: :created, location: @geolocation
    else
      render json: @geolocations.filter{ |geo| !geo.valid }.map{ |geo| geo.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /geolocations/1
  def update
    if @geolocation.update(geolocation_params)
      render json: @geolocation
    else
      render json: @geolocation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /geolocations/1
  def destroy
    @geolocation.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_geolocation
      @geolocation = params[:gps_device_id] ?
                       current_user.geolocations.find(params[:gps_device_id]).geolocations.find(params[:id]) :
                       current_user.geolocations.find(params[:id])
    end

    def geolocation_params
      permit_params =  params.permit(:url, :serial_id)
      source = permit_params[:serial_id] ? GpsDevice.find_by(serial_id: permit_params[:serial_id]) : current_user
      url_ips = GeolocationsService.get_ip_from_url(permit_params[:url])
      ips = url_ips.present? ? url_ips : [request.remote_ip]
      #ips = url_ips.present? ? url_ips : ["45.188.165.193"]
      ips.map{ |ip| GeolocationsService.get_location_from_ip(ip).merge(ip: ip) }.map { |coordinate| {url: permit_params[:url], source: source}.merge(coordinate)}
    end
end
