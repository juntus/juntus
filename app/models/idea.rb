class Idea < ActiveRecord::Base
  attr_accessible :description, :short_description, :title, :logo, :background
  
  validates :title, :description, :short_description, :user_id, presence: true
  
  has_many :registrations
  has_many :users, :through => :registrations
  belongs_to :owner, :class_name => User, :foreign_key => :user_id
  
  has_attached_file :logo, 
                    :styles => { :medium => "216x216>", :thumb => "100x100>" },
                    :storage => :s3,
                    :bucket => ENV['AMAZON_S3_BUCKET'],
                    :path => "logos/:id.:style.:extension",
                    :s3_credentials => {
                      :access_key_id => ENV['AMAZON_ACCESS_KEY_ID'],
                      :secret_access_key => ENV['AMAZON_SECRET_ACCESS_KEY']
                    }
                    
  has_attached_file :background, 
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :storage => :s3,
                    :bucket => ENV['AMAZON_S3_BUCKET'],
                    :path => "backgrounds/:id.:style.:extension",
                    :s3_credentials => {
                      :access_key_id => ENV['AMAZON_ACCESS_KEY_ID'],
                      :secret_access_key => ENV['AMAZON_SECRET_ACCESS_KEY']
                    }
  
  def to_param
    "#{id}-#{title.parameterize}"
  end
end