class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @posts = Post.where(user_id: current_user.id)
  end
end
