class StatusesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorize_header
  # POST /data
  def create
    @status = Status.new(status_params)

    if @status.save
      render json: {'message':'Success'}, status: :created
    else
      render json: @status.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def status_params
    params.require(:status).permit(:serial_number, :value, :time)
  end

  def authorize_header
    unless request.headers["Authorization"] == "XGHA-1HAB-Y76Z-29VW"
      render json: {'message':'Unauthorized'}, status: :forbidden
    end
  end
end
