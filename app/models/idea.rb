class Idea < ActiveRecord::Base
  attr_accessible :content, :followers, :user_id
  belongs_to :user
  validates :content, :length => { :maximum => 140 }
end
