class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :vote]
  before_action :authenticate_user!, except: [:index, :show]
  respond_to :js, :json, :html

  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 4)
  end

  def show
    @comments = Comment.all
    @comments = Comment.where(post_id: @post).order("created_at DESC")
    @comments = @post.comments.paginate(page: params[:page], per_page: 3)
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
    end
  end

  def vote
    if !current_user.liked? @post
      @post.liked_by current_user
    elsif current_user.liked? @post
      @post.unliked_by current_user
    end
  end

  private
    def set_post
      @post = Post.friendly.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The page you were looking for could be found!"
      redirect_to(request.referrer || posts_url)
    end

    def post_params
      params.require(:post).permit(:title, :content, :user_id, :image)
    end
end
