class IdeasController < ApplicationController
  before_filter :signed_in_user

  def create
    @idea = current_user.ideas.build(params[:idea])
    if @idea.save
      flash[:success] = "Idea created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
  end

  def show
    @idea = Idea.find(params[:id])
    @user = User.find(@idea.user_id)
  end
end