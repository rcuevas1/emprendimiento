class StaticPagesController < ApplicationController
  before_filter :signed_in_user,     only: [:admin]
  def home
      @popular_ideas =  Idea.find([1,2,3])
      @popular_brands = Brand.find([1,2]) 
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
        @followers = 0
	@ideas.each do |idea|
		@followers += idea.followers.count
	end
	
	@ratio = (BigDecimal(@ideas.count)/BigDecimal(@followers)).to_f
	
  end
end
