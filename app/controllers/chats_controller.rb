class ChatsController < ApplicationController
  before_action :require_login

  def index
    @user_chats = current_user.chats
    #@received_chats = current_user.received_chats
    if logged_in?
      @user_name = current_user.name
      @user_email = current_user.email
    end
  end

  def show
    @chat = current_user.chats.find_by(id: params[:id])
    if logged_in?
      @user_name = current_user.name
      @user_email = current_user.email
    end

    if @chat.nil?
      redirect_to chats_path
    else
      @messages = @chat.messages.includes(:user)
    end
  end

  def create
    recipient = User.find(params[:user_id])
    @chat = Chat.create_between(current_user, recipient)
    redirect_to chat_path(@chat)
  end

  private

  def require_login
    redirect_to root_path unless logged_in?
  end
end