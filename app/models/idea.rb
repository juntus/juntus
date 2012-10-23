class Idea < ActiveRecord::Base
  attr_accessible :description, :short_description, :title
  
  validates :title, :description, :short_description, presence: true
end
