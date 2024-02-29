class CommentsController < ApplicationController
  before_action :require_login

  def create
    @group_chat = GroupChat.find(params[:group_chat_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params.merge(user: current_user))

    if @comment.save
      redirect_to group_chat_path(@group_chat), notice: "Comment added successfully."
    else
      # Handle validation errors
      render 'group_chats/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end