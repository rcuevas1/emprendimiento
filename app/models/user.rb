class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password

  has_many  :ideas, dependent: :destroy


  has_many :followships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_ideas, through: :followships, source:  :followed_idea


  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def feed
    # aqui se genera el feed que se muestra en home
    followed_ideas
    
  end
 #quizas deberian ir en ideas tambien
  def following?(some_idea)
    followships.find_by_followed_idea_id(some_idea.id)
  end

  def follow!(some_idea)
    followships.create!(followed_idea_id: some_idea.id)
  end

  def unfollow!(some_idea)
    followships.find_by_followed_idea_id(some_idea.id).destroy
  end


  private
    def create_remember_token
      # Create the token.
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
