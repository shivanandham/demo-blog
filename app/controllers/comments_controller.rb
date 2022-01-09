class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: :destroy

  def create
    binding.pry
    comment = @post.comments.create! content: params[:comment][:content], user_id: current_user.id
    CommentsMailer.submitted(comment).deliver_later
    redirect_to @post
  end

  def destroy
    binding.pry
    @comment.destroy
  end
  
  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = Comment.find(params[:comment_id])
    end
end
