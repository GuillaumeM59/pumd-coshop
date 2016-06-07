class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_presence_of :city, :username, :nom, :prenom, :email, :adress, :zipcode, :dob
  validates_uniqueness_of :username, :email, :phone
    after_create :build_profile

    def build_profile
      @coin1 = Coin.new
      @coin1.user_id = self.id
      @coin1.comment1 = "Welcome cocoin 1"
      @coin1.save
      @coin2 = Coin.new
      @coin2.user_id = self.id
      @coin2.comment1 = "Welcome cocoin 1"
      @coin2.save
    end


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
