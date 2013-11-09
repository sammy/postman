class PostsController < ApplicationController
  before_action :set_post, :only => [:show, :edit]
  
  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Your post has been created!"
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = "Post successfully updated"
      redirect_to posts_path
    else
      render :edit
    end
  end

  def to_s
    "#{url}-#{title}"
  end

private

  def post_params
    params.require(:post).permit!
  end

  def set_post
    @post = Post.find(params[:id])
  end


end
