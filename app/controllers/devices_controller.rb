# frozen_string_literal: true

class DevicesController < ApplicationController
  before_action :authenticate_user!, only: %i[assign unassign]

  def index
    @users = User.all
    @devices = Device.where(user_id: nil)
  end

  def assign
    device = Device.find(params[:device_id])
    
    if device.user
      render plain: "Device is already assigned to another user.", status: :forbidden
    else
      device.update(user_id: params[:user_id])
      redirect_to devices_path, notice: "Device assigned successfully."
    end
  end

  def unassign
    device = Device.find_by(serial_number: params[:serial_number])

    if device.user != @current_user
      render plain: "You cannot unassign this device because you didn't assign it.", status: :forbidden
    else
      device.update(user: nil)
      head :ok
    end
  end

  private

  def device_params
    params.permit(:serial_number)
  end
end
