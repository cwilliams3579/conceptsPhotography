class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  respond_to :js, :json, :html

  def create
    @post = Post.friendly.find(params[:post_id])
    # @post = Post.friendly.find(params[:comment][:id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save 
      respond_to do |format|
        format.html { redirect_to @post }
        format.js # render comments/create.js.erb
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id)
    end
end