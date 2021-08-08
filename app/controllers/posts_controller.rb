class PostsController < ApplicationController
  def index
    @posts = PostService.all
  end

  def show
    @post = PostService.find(params[:id])
    @comments = PostService.find_comments(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = PostService.create(post: post_params)
    if @post
      flash[:success] = 'The post was created successfully.'
      redirect_to post_path(@post.id)
    else
      flash[:error] = 'Failed to create the post'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
