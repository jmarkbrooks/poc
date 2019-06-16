class Device < ApplicationRecord
  has_many :temperatures, foreign_key: :serial_number, primary_key: :serial_number
  has_many :statuses, foreign_key: :serial_number, primary_key: :serial_number
  has_many :monoxides, foreign_key: :serial_number, primary_key: :serial_number
  has_many :humidities, foreign_key: :serial_number, primary_key: :serial_number
  validates :serial_number, :registration_date, :firmware_version, presence: true
  validates :serial_number, uniqueness: { message: "device is already registered" }
end
