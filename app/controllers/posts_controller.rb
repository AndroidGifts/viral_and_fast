class PostsController < ApplicationController

  before_action :authenticate_editor!, except: [:index, :show]

  layout 'default'

  def index
    @posts = Post.visible.recent
  end

  def show
    @single_post = Post.find(params[:id])
  end

  def new
    @new_post = Post.new()
  end

  def create
    @new_post = Post.new(post_params)

    #Attach an editor to the post
    post_editor = current_editor

    #Getting post category
    post_category = params[:post_category]

    if @new_post.save

      #Attach the editor and categories to the post
      post_editor.posts << @new_post
      @new_post.categories << Category.find(post_category)

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
    params.require(:post).permit(:title, :content, :image, :post_categories)
  end

end
