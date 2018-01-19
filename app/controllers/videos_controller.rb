class VideosController < ApplicationController
  before_action :set_user
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def index
    @tag_list = Video::TAG_LIST
    if params[:intensity].present?
      @videos = Video.where(intensity: params[:intensity])
    elsif params[:zone].present?
      @videos = Video.tagged_with(params[:zone])
    else
      @videos = Video.all
    end
  end

  def show
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    params[:video][:tag_list].each { |tag| @video.tag_list.add(tag)}
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
    @video.tag_list = ""
    params[:video][:tag_list].each { |tag| @video.tag_list.add(tag)}
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
    params.require(:video).permit(:name, :url, :description, :video_duration,
     :intensity, :user, :thumbnail)
  end
end
