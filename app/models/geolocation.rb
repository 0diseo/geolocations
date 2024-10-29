class Geolocation < ApplicationRecord
  belongs_to :source, polymorphic: true
  validates :source, presence: true
end
