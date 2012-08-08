class Brand < ActiveRecord::Base 

  attr_accessible :description, :name, :image
  validates :name, presence: true
  validates :description, presence: true  
  has_many :ideas
  has_attached_file :image
end
