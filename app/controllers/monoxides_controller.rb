class MonoxidesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorize_header
  # POST /data
  def create
    @monoxide = Monoxide.new(monoxide_params)

    if @monoxide.save
      render json: {'message':'Success'}, status: :created
    else
      render json: @monoxide.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def monoxide_params
    params.require(:monoxide).permit(:serial_number, :value, :time)
  end

  def authorize_header
    unless request.headers["Authorization"] == "XGHA-1HAB-Y76Z-29VW"
      render json: {'message':'Unauthorized'}, status: :forbidden
    end
  end
end
