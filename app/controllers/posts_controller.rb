class PostsController < ApplicationController
  def index
  end
  
  def new
  	
  end

  def show
  	@post = Post.find(params[:id])
  	@user = @post.user
  end
end
