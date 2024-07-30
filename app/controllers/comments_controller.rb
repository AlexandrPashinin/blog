class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:destroy]

  def create
    @comment = @post.comments.build(comment_params)

    if @comment.save
      redirect_to @post, notice: 'Комментарий был успешно создан.'
    else
      redirect_to @post, alert: 'Не удалось создать комментарий.'
    end
  end

  def destroy
    @comment.destroy
    redirect_to @post, notice: 'Комментарий был успешно удален.'
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
