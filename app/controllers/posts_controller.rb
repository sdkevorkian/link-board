class PostsController < ApplicationController
  def index
    @posts = @current_user.posts
  end

  def new
    @post = Post.new
  end

  def create
    @current_user.posts.create(post_params)
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    p = Post.find(params[:id])
    p.update(post_params)
    redirect_to action: "show", id: params[:id]
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy

    Post.find(params[:id]).delete
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :link)
  end

end
