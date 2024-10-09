# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

users = User.create!([
  { email: 'jan.nowak@gmail.com', password: 'password123', password_confirmation: 'password123' },
  { email: 'anna.lesniczak@gmail.com', password: 'password123', password_confirmation: 'password123' },
  { email: 'ryszard.paz@gmail.com', password: 'password123', password_confirmation: 'password123' }
])


devices = Device.create!([
  { serial_number: 'DEVICE123' },
  { serial_number: 'DEVICE456' },
  { serial_number: 'DEVICE789' }
])