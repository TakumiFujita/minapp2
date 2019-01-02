class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(like_params)
    if @like.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

  private
    def like_params
      params.require(:like).permit(:post_id, :user_id)
    end
end
