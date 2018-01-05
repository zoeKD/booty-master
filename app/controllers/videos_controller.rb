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
    @video.intensity = params[:intensity]
    @video.user = @user
    if @video.save
      redirect_to videos_path
    else
      flash[:alert] = "Problème en créant la vidéo"
      render :new
    end
  end

  def edit
  end

  def update
    @video.intensity = params[:intensity] if params[:intensity]
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
    params.require(:video).permit(:name, :url, :description, :tag_list, :video_duration,
     :intensity, :user)
  end
end
