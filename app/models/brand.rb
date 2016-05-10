class Brand < ActiveRecord::Base
  has_many :shops


  #uploader carrierwave
    mount_uploader :brandpic, BrandpicUploader

end
