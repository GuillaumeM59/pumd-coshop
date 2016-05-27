class Bid < ActiveRecord::Base
  has_many :users
  belongs_to :shop
  belongs_to :brand, through: :shops
  has_many :feedbacks


end
