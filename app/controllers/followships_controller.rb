class FollowshipsController < ApplicationController
  before_filter :signed_in_user

  def create
    store_location
    @idea = Idea.find(params[:followship][:followed_idea_id])
    current_user.follow!(@idea)
    redirect_to @idea
  end

  def destroy
    @idea = Followship.find(params[:id]).followed_idea
    current_user.unfollow!(@idea)
    redirect_to @idea
  end
end
