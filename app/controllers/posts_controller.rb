class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show, :create, :edit, :update, :destroy]
  def index
    @posts = Post.paginate(page: params[:page], per_page: 2)
  end

  def upvote
    @post = Post.find(params[:id])
    if  current_user.voted_up_on?(@post )
    @post.unvote_by(current_user )
    else
      @post.upvote_by(current_user)
    end
    render 'vote.js.erb'
  end

  def downvote
    @post = Post.find(params[:id])
    if current_user.voted_down_on? @post
      @post.unvote_by(current_user)
    else
      @post.downvote_by(current_user)
    end
    render "vote.js.erb"
  end

  def show
    @comments = @post.comments
    @user = current_user
    @comment = Comment.new
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params )
    @post.user = current_user
    if @post.save!
      redirect_to @post
    else
      render :show
    end
  end

  def edit
  end
  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end
  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
