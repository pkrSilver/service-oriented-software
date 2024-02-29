class HobbiesController < ApplicationController
  before_action :require_login

  def new
    @user_name = current_user.name
    @user_email = current_user.email
    @group_chats = GroupChat.all
  end

  private

  def require_login
    redirect_to root_path unless logged_in?
  end
end