class Idea < ActiveRecord::Base
  attr_accessible :description, :short_description, :title
  
  validates :title, :description, :short_description, presence: true
  
  has_many :registrations
  has_many :users, :through => :registrations
  
  def to_param
    "#{id}-#{title}"
  end
end
