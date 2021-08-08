class CommentsController < ApplicationController
  def create
    params[:name] = 'Current User' # in a real application, current user can be retrieved from the session
    @comment = PostService.create_comment(comment: comment_params)
    if @comment
      flash[:success] = 'The comment was created successfully.'
      redirect_to post_path(@comment.post_id)
    else
      flash[:error] = 'Failed to create the comment'
      render :new
    end
  end

  private

  def comment_params
    params.permit(:name, :body, :post_id)
  end
end
