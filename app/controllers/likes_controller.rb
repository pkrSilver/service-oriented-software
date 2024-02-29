class LikesController < ApplicationController
  before_action :require_login

  def create
    @group_chat = GroupChat.find(params[:group_chat_id])
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user: current_user)

    if @like.save
      redirect_to group_chat_path(@group_chat), notice: "Liked post."
    else
      # Handle validation errors
      render 'group_chats/show'
    end
  end
end