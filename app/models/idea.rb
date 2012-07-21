class Idea < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user

  validates :content, presence: true, length: { maximum: 120 }
  validates :user_id, presence: true
  default_scope order: 'ideas.created_at DESC'
end
