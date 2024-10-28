class GpsDevicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_gps_device, only: %i[ show update destroy ]

  # GET /gps_devices
  def index
    @gps_devices = current_user.gps_devices

    render json: @gps_devices
  end

  # GET /gps_devices/1
  def show
    render json: @gps_device
  end

  # POST /gps_devices
  def create
    @gps_device = GpsDevice.new(gps_device_params.merge(user: current_user))

    if @gps_device.save
      render json: @gps_device, status: :created, location: @gps_device
    else
      render json: @gps_device.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gps_devices/1
  def update
    if @gps_device.update(gps_device_params)
      render json: @gps_device
    else
      render json: @gps_device.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gps_devices/1
  def destroy
    @gps_device.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gps_device
      @gps_device = current_user.gps_devices.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gps_device_params
      params.require(:gps_device).permit(:serial_id)
    end
end
