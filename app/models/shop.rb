class Shop < ActiveRecord::Base
  belongs_to :brand
  has_many :bids
  has_one :city
end
