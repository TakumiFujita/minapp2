class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @posts = Post.new
  end

  def create
    @posts = Post.create(post_params)
    redirect_to acction: "index"
  end

  def show
    @posts = Post.find(params[:id])
    @comments = @posts.comments.includes(:user)
    @like = Like.new
    end


    def edit
     @posts = Post.find(params[:id])
    end

  def update
   post = Post.find(params[:id])
  post.update(post_params)
  redirect_to action: "index"
  end

  def destroy
    posts = Post.find(params[:id])
    posts.destroy
    redirect_to action: "index"
  end


  private

  def post_params
    params.require(:post).permit(:title, :body).merge(user_id: current_user.id)
  end


end
