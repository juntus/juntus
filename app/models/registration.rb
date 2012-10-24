class Registration < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea
  # attr_accessible :title, :body
end
