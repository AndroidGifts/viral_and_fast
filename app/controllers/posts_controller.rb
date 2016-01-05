class PostsController < ApplicationController

  layout 'default'

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
    @new_post = Post.new(post_params)

    #Attach an editor to the post
    post_editor = Editor.first

    #Getting all the checkboxes values sent from 'New' form
    post_categories_ids = params[:post_categories]

    if @new_post.save

      #Attach the editor and categories to the post
      post_editor.posts << @new_post
      post_categories_ids.each do |cat_id|
        category = Category.find_by_id(cat_id)
        @new_post.categories << category
      end

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
