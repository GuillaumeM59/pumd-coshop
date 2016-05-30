class Bid < ActiveRecord::Base
  has_many :users
  belongs_to :shop
  has_one :brand, through: :shop
  has_many :feedbacks


end
