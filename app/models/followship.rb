class Followship < ActiveRecord::Base
  attr_accessible :followed_idea_id, :follower_id

  belongs_to :follower, class_name: "User"   #se agrega la clase de followed ya que no puede saber
                                             #automaticamente que es un usuario
  belongs_to :followed_idea, class_name: "Idea"     #TODO: verificar que este correcto en 11.1.5

  validates :follower_id, presence: true
  validates :followed_idea_id, presence: true
end
