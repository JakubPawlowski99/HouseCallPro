# frozen_string_literal: true

class AssignDeviceToUser
  def initialize(requesting_user:, serial_number:, new_device_owner_id:)
    @requesting_user = requesting_user
    @serial_number = serial_number
    @new_device_owner_id = new_device_owner_id
  end

  def call
    device = Device.find_by!(serial_number: @serial_number)

    if device.user && device.user_id != @new_device_owner_id
      raise "Device is already assigned to another user."
    end

    if @requesting_user.devices.where(id: device.id).exists?
      raise "You can't reassign the same device to yourself."
    end

    device.update!(user_id: @new_device_owner_id)
  end
end
