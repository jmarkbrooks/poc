class DevicesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorize_header
  # POST /data
  def create
    @device = Device.new(device_params)

    if @device.save
      render json: {'message':'Success'}, status: :created
    else
      render json: @device.errors, status: :unprocessable_entity
    end
  end

  private

    def device_params
      params.require(:device).permit(:serial_number, :registration_date, :firmware_version)
    end

    def authorize_header
      unless request.headers["Authorization"] == "XGHA-1HAB-Y76Z-29VW"
        render json: {'message':'Unauthorized'}, status: :forbidden
      end
    end
end
