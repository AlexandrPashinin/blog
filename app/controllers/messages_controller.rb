class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @messages = Message.all
    render json: @messages
  end

  def new
    @message = Message.new(message_params)
  end
  def create
    @message = Message.new(message_params)
    if @message.save
      render json: { message: 'Message created successfully', data: @message }, status: :created
    else
      render json: { error: 'Failed to create message' }, status: :unprocessable_entity
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

end
