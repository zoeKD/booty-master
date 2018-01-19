class Video < ApplicationRecord
  belongs_to :user
  validates :url, presence: :true, uniqueness: true
  validates :name, :intensity, :video_duration, presence: :true
  validates :video_duration, numericality: { only_integer: true }
  validates :intensity, inclusion: { in: (1..3)}
  has_many :video_workouts
  has_many :workouts, through: :video_workouts
  acts_as_taggable

  after_save :set_default_picture

  TAG_LIST = %w(fullbody cardio legs arms core stretching)

  def set_default_picture
    if thumbnail == "" || thumbnail.nil?
      self.update(thumbnail: ActionController::Base.helpers.image_path("placeholder-video.png"))
   end
 end
end
