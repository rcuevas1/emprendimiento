class StaticPagesController < ApplicationController
  before_filter :signed_in_user,     only: [:admin]
  def home
      @popular_ideas =  Idea.all
	#por el momento las marcas populares son todas
      @popular_brands = Brand.all
    if signed_in?
      @idea  = current_user.ideas.build    
	#llama al current user, que tiene un atributo feed definido en la clase      
      @feed_items = current_user.feed.paginate(page: params[:page], :per_page => 5)
        
    end
  end

  def about
  end
  def admin
	#Indice ideas/follows
	@ideas = Idea.all
	@users = User.all.count
        @followers = 0
	@ideas.each do |idea|
		@followers += idea.followers.count
	end
	
	@ratio = @ideas.count.to_f/@followers.to_f
	@ratio1 = @ideas.count.to_f/@users.to_f
	
  end
end
