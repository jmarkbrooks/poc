class Humidity < ApplicationRecord
  belongs_to :device, foreign_key: :serial_number, primary_key: :serial_number
  validates :serial_number, :value, :time, presence: true
  validates :value, numericality: true
end
