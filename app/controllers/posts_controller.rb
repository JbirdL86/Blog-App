class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.recent_posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(post_params)
    @user = current_user
    @post.author_id = @user.id
    @post.comments_counter = 0
    if @post.save
      redirect_to user_path(@post.author_id)
    end
  end

  def new
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :comments_counter, :likes_counter)
  end
end
