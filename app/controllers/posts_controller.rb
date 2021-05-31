class PostsController < ApplicationController

  def index
    @posts = Post.all.order(id: "DESC")
  end

  def create
    Post.create(content: params[:content])
    redirect_to action: :index
  end

  def cheaked
    post = Post.find(params[:id])
    if post.cheaked
      post.update(cheaked: false)
    else
      post.update(cheaked: true)
    end

    item = Post.find(params[:id])
    render json: { post: item }
  end
end
