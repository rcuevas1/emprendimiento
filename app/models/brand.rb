class Brand < ActiveRecord::Base 
  attr_accessible :description, :name, :image
  validates :name, presence: true
  validates :description, presence: true  
  has_many :ideas
  has_attached_file :image,
	:styles => {:mini=> "50x50#",:thumb=> "100x100#",:small  => "150x150>" }
	
	
end
