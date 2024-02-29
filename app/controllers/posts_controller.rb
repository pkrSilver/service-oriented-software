class PostsController < ApplicationController
  before_action :require_login

  def create
    @group_chat = GroupChat.find(params[:group_chat_id])
    @post = @group_chat.posts.build(post_params.merge(user: current_user))

    if @post.save
      redirect_to group_chat_path(@group_chat), notice: "Post created successfully."
    else
      # Handle validation errors
      puts "Post save failed. Errors: #{@post.errors}"
      render 'group_chats/show'
    end
  end
  def destroy
    @group_chat = GroupChat.find(params[:group_chat_id])
    @post = @group_chat.posts.find(params[:id])

    if @post.user == current_user
      @post.destroy
      redirect_to group_chat_path(@group_chat), notice: "Post deleted successfully."
    else
      redirect_to group_chat_path(@group_chat), alert: "You don't have permission to delete this post."
    end
  end
  private

  def post_params
    params.require(:post).permit(:content)
  end
end