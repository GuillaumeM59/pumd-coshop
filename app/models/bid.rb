class Bid < ActiveRecord::Base
  has_many :users
  belongs_to :shop
  belongs_to :brand, though: :shops
  has_many :feedbacks


end
