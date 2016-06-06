class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

#bdd links
  has_many :bids
  has_many :coins


#uploader carrierwave
  mount_uploader :avatar, AvatarUploader

#locate by geocoder


  geocoded_by :city
after_validation :geocode




end
