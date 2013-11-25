class PostsController < ApplicationController
  
  before_action :set_post, :only => [:show, :edit, :vote]
  before_action :require_login, :only => [:new, :create, :edit, :update, :vote]
  
  def index
    @posts = Post.all(:order => "created_at DESC")
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
    if current_user == @post.user
      @categories = Category.all
    else
      flash[:alert] = "Action not Allowed!"
      redirect_to :posts
    end
  end

  def update
    @post = Post.find_by(slug: params[:id])

    if @post.update(post_params)
      flash[:notice] = "Post successfully updated"
      redirect_to posts_path
    else
      render :edit
    end
  end

  def vote
    @vote = Vote.create(voteable: @post, :user_id => current_user.id, :vote => params[:vote]) 
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end

  end


private

  def post_params
    params.require(:post).permit!
  end

  def set_post
    @post = Post.find_by(slug: params[:id])
  end


end
