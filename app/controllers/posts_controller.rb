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
    @post = Post.new(post_params)
    @user = current_user
    if @post.save
      flash[:success] = 'Post successfully created.'
      redirect_to user_path(@user.id)
    else
      flash[:alert] = 'Error: post is not published'
    end
  end

  def new
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:author_id, :title, :text, :comments_counter, :likes_counter)
  end
end
