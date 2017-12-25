class VideosController < ApplicationController
  before_action :set_user
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def index
    @videos = Video.all
  end

  def show
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @video.user = @user
    if @user.save
      redirect_to videos_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @video.update(video_params)
      redirect_to videos_path
    else
      render :edit
    end
  end

  def destroy
    @video.destroy
    redirect_to videos_path
  end

  private

  def set_user
    @user = current_user
  end

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:name, :url, :description, :tag_list, :duration,
     :intensity, :user)
  end
end
