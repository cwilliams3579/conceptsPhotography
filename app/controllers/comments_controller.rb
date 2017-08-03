class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save

      respond_to do |format|
        format.html { redirect_to @post }
        format.js # render comments/create.js.erb
      end
    else
      flash[:danger] = "Opps something went wrong!"
      redirect_to root_url
    end
  end

  #   def destroy
#     # @comment = Comment.find(params[:id])
#     @comment.destroy
#     respond_to do |format|
#       format.html { redirect_to post_path(@post) }
#       format.json { head :no_content }
#       format.js   { render :layout => false }
#     end
#   end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end