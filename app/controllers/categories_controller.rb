class CategoriesController < ApplicationController
  layout 'default'
  
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @new_category = Category.new()
  end

  def create
    @new_category = Category.new(category_params)

    if @new_category.save
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
  def category_params
    params.require(:category).permit(:name, :description, :image)
  end

end
