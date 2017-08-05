class GalleriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_gallery, only: [:show, :edit, :update, :destroy, :vote]
  before_action :authorize_admin, only: [:new]
  respond_to :js, :json, :html

  def index
    @galleries = Gallery.paginate(:page => params[:page], :per_page => 4)
  end

  def show
    @user = User.all
  end

  def new
    @gallery = Gallery.new
  end

  def edit
  end

  def create
  @gallery = Gallery.new(gallery_params)
  @gallery.user_id = current_user.id

  respond_to do |format|
    if @gallery.save
      format.html { redirect_to @gallery, notice: 'Gallery was successfully created.' }
      format.json { render :show, status: :created, location: @gallery }
    else
      format.html { render :new }
      format.json { render json: @gallery.errors, status: :unprocessable_entity }
    end
  end
end

  def update
    respond_to do |format|
      if @gallery.update(gallery_params)
        format.html { redirect_to @gallery, notice: 'Gallery was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @gallery.destroy
    respond_to do |format|
      format.html { redirect_to galleries_url, notice: 'Gallery was successfully destroyed.' }
    end
  end

  def vote
    if !current_user.liked? @gallery
      @gallery.liked_by current_user
    elsif current_user.liked? @gallery
      @gallery.unliked_by current_user
    end
  end

  private
    def set_gallery
      @gallery = Gallery.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The image you were looking for could be found!"
      redirect_to(request.referrer || galleries_url)
    end

    def gallery_params
      params.require(:gallery).permit(:title, :user_id, {images: []})
    end
end
