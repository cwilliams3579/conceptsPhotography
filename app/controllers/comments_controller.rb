class CommentsController < ApplicationController
  before_action :find_post
  before_action :authenticate_user!

  def create
    @comment = @post.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  private
    def find_post
      @post = Post.find(params[:post_id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The page you were looking for could be found."
      redirect_to(request.referrer || posts_url)
    end

end
