class CommentsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "comments_#{params[:post_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
