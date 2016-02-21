class PostsController < ApplicationController
  before_action :authenticate_editor!, except: [:index, :show]
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  layout 'default'

  def index
    @posts = Post.visible.recent
  end

  def show
  end

  def new
    @post = Post.new()
  end

  def create
    @post = Post.new(post_params)

    #Attach an editor to the post
    post_editor = current_editor

    #Getting post category
    post_category = params[:post_category]

    if @post.save

      #Attach the editor and categories to the post
      post_editor.posts << @post
      @post.categories << Category.find(post_category)

      redirect_to post_path(@post)
    else
      render('new')
    end
  end

  def edit
  end

  def update
    #Getting post category
    post_category = params[:post_category]

    if @post.update(post_params)
      @post.categories << Category.find(post_category)

      redirect_to post_path(@post)
    else
      render('edit')
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :image, :post_categories)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
