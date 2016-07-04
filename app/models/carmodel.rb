class Carmodel < ActiveRecord::Base
  has_one :carbrand, dependent: :destroy
end
