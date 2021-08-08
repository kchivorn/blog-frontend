class PostsController < ApplicationController
  def index
    @posts = PostService.all
  end

  def show
    @post = PostService.find(params[:id])
    @comments = PostService.find_comments(params[:id])
  end
end
