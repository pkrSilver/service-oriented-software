class GroupChatroomsController < ApplicationController
  def index
    @group_chatrooms = current_user.group_chatrooms
    if logged_in?
      @user_name = current_user.name
      @user_email = current_user.email
    end
  end

  def new
    @users = User.all
    if logged_in?
      @user_name = current_user.name
      @user_email = current_user.email
    end
  end

  def create
    @group_chatroom = GroupChatroom.create(name: params[:group_chatroom_name])

    if params[:user_ids].present?
      user_ids = params[:user_ids].reject(&:empty?) 
      user_ids.each do |user_id|
        @group_chatroom.group_chatroom_users.create(user_id: user_id)
      end
    end

    redirect_to group_chatroom_path(@group_chatroom)
  end

  def show
    @group_chatroom = GroupChatroom.find(params[:id])
    redirect_to group_chatrooms_path, alert: "You don't have access to this group chat" unless @group_chatroom.users.include?(current_user)
    @messages_group_chatrooms = @group_chatroom.messages_group_chatrooms.order(created_at: :asc)
    if logged_in?
      @user_name = current_user.name
      @user_email = current_user.email
    end
  end
    
  def create_message
    @group_chatroom = GroupChatroom.find(params[:group_chatroom_id])
    @message = @group_chatroom.messages_group_chatrooms.create(content: params[:content], user_id: current_user.id)
    redirect_to group_chatroom_path(@group_chatroom)
  end
end