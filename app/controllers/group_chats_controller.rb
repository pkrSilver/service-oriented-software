class GroupChatsController < ApplicationController
  before_action :require_login

  def new
    @group_chat = GroupChat.new
    @group_chats = GroupChat.all
  end

  def create
    @group_chat = current_user.group_chats.build(group_chat_params)

    if @group_chat.save
      redirect_to hobby_path, notice: "Group Chat created successfully."
    else
      render :new
    end
  end

  def show
    @user_name = current_user.present? ? current_user.name : 'Guest'
    @user_email = current_user.present? ? current_user.email : ''
    @group_chat = GroupChat.includes(posts: [:user, :comments]).find(params[:id])
    @users_with_activity = (@group_chat.posts.map(&:user) + @group_chat.posts.map(&:comments).flatten.map(&:user)).uniq  end

  private

  def group_chat_params
    params.require(:group_chat).permit(:name).merge(user_id: current_user.id)
  end

  def require_login
    redirect_to root_path unless logged_in?
  end    
    
end