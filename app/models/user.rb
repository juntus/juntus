class User < ActiveRecord::Base
  attr_accessible :access_token, :email, :name, :provider, :uid
  
  validates :name, :email, presence: true
end
