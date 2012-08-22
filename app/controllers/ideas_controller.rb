class IdeasController < ApplicationController
  before_filter :signed_in_user,     only: [:destroy, :create, :new]
  before_filter :admin_user,     only: [:destroy]

  def create
    @idea = current_user.ideas.build(params[:idea])
    @brand = Brand.find(params[:brand_id])
    @idea.brand_id = @brand.id
   
	
    if @idea.save
      flash[:success] = "Idea created!"
      redirect_to @brand
    else
      @feed_items = []
      redirect_to @brand
    end
  end

  def destroy
    Idea.find(params[:id]).destroy
    flash[:success] = "Idea destroyed."
    redirect_to brands_path
  end

  def show
    @idea = Idea.find(params[:id])
    @brand = Brand.find(@idea.brand_id)
    @user = User.find(@idea.user_id)
  end
	private
	 	def admin_user
        	redirect_to(root_path) unless current_user.admin?
      		end
end
