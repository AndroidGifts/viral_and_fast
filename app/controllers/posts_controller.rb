class PostsController < ApplicationController

  layout false

  def index
    @posts = Post.all
  end

  def show
    @single_post = Post.find(params[:id])
  end

  def new
    @new_post = Post.new()
  end

  def create
    
  end

  def edit

  end

  def update
  end

  def delete
  end
end
