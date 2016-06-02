class Shop < ActiveRecord::Base
  belongs_to :brand
  has_many :bids
  has_one :city

def full_street_address

end


  geocoded_by :address  # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address
end
