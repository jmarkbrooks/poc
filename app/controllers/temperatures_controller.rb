class TemperaturesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorize_header
  # POST /data
  def create
    logger.info "temperature_params:#{temperature_params.inspect}"
    @temperature = Temperature.new(temperature_params)

    if @temperature.save
      render json: {'message':'Success'}, status: :created
    else
      render json: @temperature.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def temperature_params
    params.require(:temperature).permit(:serial_number, :value, :time)
  end

  def authorize_header
    unless request.headers["Authorization"] == "XGHA-1HAB-Y76Z-29VW"
      render json: {'message':'Unauthorized'}, status: :forbidden
    end
  end
end
