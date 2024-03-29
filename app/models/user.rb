class User < ActiveRecord::Base
  attr_accessible :access_token, :email, :name, :provider, :uid
  
  validates :name, :email, presence: true
  
  has_many :ideas
  has_many :registrations
  has_many :ideas
  
  def self.find_or_create_with_omniauth(auth)
    user = self.find_or_create_by_provider_and_uid(auth["provider"], auth["uid"])
    user.assign_attributes({:name => auth["info"]["name"], :email => auth["info"]["email"], :access_token => auth["credentials"]["token"], :photo_url => auth["info"]["image"]}, :without_protection => true)
    user.save(:validate => false)
    user
  end
end
