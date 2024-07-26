class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end
  def show
    @comments= Comment.find(params[:id])
  end

  def delete
    @comments = Comment.find(params[:id])
    @comments.destroy
  end
end
