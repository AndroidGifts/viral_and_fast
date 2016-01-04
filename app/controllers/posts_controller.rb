class PostsController < ApplicationController

  layout false

  def index
    @posts = Post.all
  end

  def show
    @single_post = Post.find(params[:id])
  end

  def new
    @new_post = Post.new({:likes_count => 0, :comment_count => 0, :type => nil})
  end

  def create
    @new_post = Post.new(post_params)

    if @new_post.save
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit

  end

  def update
  end

  def delete
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :image)
  end

end
