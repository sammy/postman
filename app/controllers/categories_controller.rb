class CategoriesController < ApplicationController

  before_action :require_login, except: [:show]

  def index
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find_by(slug: params[:id])
    @posts = Post.joins(:categories).where("category_id = ?", @category.id)
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
    @category = Category.find_by(slug: params[:id])
  end

end