class PostsController < ApplicationController
  
  before_action :set_post, :only => [:show, :edit, :vote]
  before_action :require_login, :only => [:new, :create, :edit, :update]
  
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

  def vote
    if logged_in?
      @vote = Vote.create(voteable: @post, :user_id => current_user.id, :vote => params[:vote])

      if @vote.valid?
        flash[:notice] = "Your vote has been submitted!"
      else
        flash[:alert] = "#{@vote.errors.full_messages[0]}"
      end
    else
      flash[:alert] = "You need to be logged in to vote!"
    end
    redirect_to :back
  end


private

  def post_params
    params.require(:post).permit!
  end

  def set_post
    @post = Post.find(params[:id])
  end


end
