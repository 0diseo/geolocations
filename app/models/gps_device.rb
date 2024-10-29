class GpsDevice < ApplicationRecord
  belongs_to :user
  has_many :geolocations, as: :source
end
