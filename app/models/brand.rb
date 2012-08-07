class Brand < ActiveRecord::Base
  require 'RMagick'

  attr_accessible :description, :name, :image
  validates :name, presence: true
  validates :description, presence: true  
  has_many :ideas
  has_attached_file :image,
	:styles => {
      :thumb=> "100x100#",
      :small  => "300x300>" }
end
