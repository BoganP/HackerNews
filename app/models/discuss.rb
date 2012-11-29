class Discuss < ActiveRecord::Base
  attr_accessible :comment, :news_id
  belongs_to :news
  belongs_to :user
  
end
