class Shop < ActiveRecord::Base
  belongs_to :brand
  has_many :bids
  has_one :city

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address
end
