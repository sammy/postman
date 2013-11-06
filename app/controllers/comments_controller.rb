class CommentsController < ApplicationController

  def create
    binding.pry
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)

    if @comment.save
      flash[:notice] = "Your comment has been created!"
      redirect_to post_path(params[:post_id])
    else
      flash[:alert] = "Oooops! something is broken inside me!"
      render 'posts/#{params[:post_id]}'
    end
  end



  private

  def comment_params
    params.require(:comment).permit!
  end
end