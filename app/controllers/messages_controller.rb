class MessagesController < ApplicationController
  before_action :require_login

  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.create(message_params.merge(user: current_user))
    redirect_to chat_path(@chat)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def require_login
    redirect_to root_path unless logged_in?
  end
end