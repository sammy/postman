class CategoriesController < ApplicationController

  def index
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @posts = Post.joins(:categories).where("category_id = ?", params[:id])
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Category has been created"
      redirect_to categories_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit!
  end

  def set_category
    @category = Category.find(params[:id])
  end

end