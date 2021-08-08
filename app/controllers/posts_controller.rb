class PostsController < ApplicationController
  def index
    @posts = PostService.all
  end
end
