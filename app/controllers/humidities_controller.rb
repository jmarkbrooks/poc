class HumiditiesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorize_header
  # POST /data
  def create
    @humidity = Humidity.new(humidity_params)

    if @humidity.save
      render json: {'message':'Success'}, status: :created
    else
      render json: @humidity.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def humidity_params
    params.require(:humidity).permit(:serial_number, :value, :time)
  end

  def authorize_header
    unless request.headers["Authorization"] == "XGHA-1HAB-Y76Z-29VW"
      render json: {'message':'Unauthorized'}, status: :forbidden
    end
  end
end
