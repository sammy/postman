class CommentsController < ApplicationController

  before_action :require_login

  def create
    
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Your comment has been created!"
      redirect_to post_path(params[:post_id])
    else
      render 'posts/show', :id => @post.id
    end
  end

  def vote
    binding.pry
    if logged_in?
      @comment = Comment.find(params[:id])
      @vote = Vote.create(voteable: @comment, :user_id => current_user.id, :vote => params[:vote])
      if @comment.valid? 
        flash[:notice] = "Your vote has been submitted!"
      else
        flash[:alert] = "Your vote was NOT counted!"
      end
    else
      flash[:alert] = "You need to be logged in to vote!"
    end
    redirect_to :back
  end



  private

  def comment_params
    params.require(:comment).permit!
  end
end