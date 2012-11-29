class News < ActiveRecord::Base
  attr_accessible :link, :title
  has_many :discusses
  belongs_to :user
  
end
