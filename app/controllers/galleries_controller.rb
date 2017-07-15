class GalleriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]

  def index
    @galleries = Gallery.all
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

  private
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    def gallery_params
      params.require(:gallery).permit(:title, :user_id, {images: []})
    end
end
