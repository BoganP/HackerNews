class News < ActiveRecord::Base
  
  serialize :ups, Array
  serialize :downs, Array
  
  attr_accessible :link, :title
  has_many :discusses
  belongs_to :user
  
  scope :top, order("score DESC")
  scope :latest, order("created_at DESC")
  
  def set_defaults
    self.score = 0
    self.ups = [] 
    self.downs = []
  end
  
  def calc_score
    if self.ups and self.downs
      self.score = self.ups.length - self.downs.length
    end
  end
  
  def inc_up(user)
   self.ups = [] unless self.ups
   unless self.ups.include?(user.id) || self.downs.include?(user.id)
     self.ups << user.id
     self.calc_score
     self.save
   end
    self.ups.length
  end
  
  def inc_down(user)
    self.downs = [] unless self.downs
    unless self.downs.include?(user.id) || self.ups.include?(user.id)
      self.downs << user.id
      self.calc_score
      self.save
    end
    self.downs.length
  end
  
  def self.filter(param)
    param = 'top' if param.nil?
    if param == 'latest'
      self.latest
    elsif param == 'top'
      self.top
    end
  end
  
end
