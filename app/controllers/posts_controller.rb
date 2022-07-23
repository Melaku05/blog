class PostsController < ApplicationController
  def index
    @users = User.find(params[:user_id])
    @posts = Post.where(author_id: @users.id).order(created_at: :desc)
  end

  def show
    @users = User.find(params[:user_id])
    @posts = Post.find(params[:id])
  end
end
