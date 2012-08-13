class Idea < ActiveRecord::Base
  attr_accessible :content, :brand_id
  belongs_to :user

  has_many :reverse_followships, foreign_key: "followed_idea_id",
           class_name:  "Followship",
           dependent:   :destroy
  has_many :followers, through: :reverse_followships, source: :follower

  validates :content, presence: true, length: { maximum: 120 }
  validates :user_id, presence: true
  validates :brand_id, presence: true
  default_scope order: 'ideas.created_at DESC'

  def self.popular

   Idea.find_by_sql("SELECT * FROM ideas
  INNER JOIN followships ON ideas.id = followships.followed_idea_id
  WHERE followships.followed_idea_id.count > 3
  ORDER ideas.created_at desc")

  end
 
end
