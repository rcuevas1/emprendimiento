class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @idea  = current_user.ideas.build    
	#llama al current user, que tiene un atributo feed definido en la clase      
      @feed_items = current_user.feed.paginate(page: params[:page], :per_page => 5)
      @popular_ideas =  Idea.find([1,2])
      @popular_brands = Brand.find([1,2])     
    end
  end

  def about
  end
end
