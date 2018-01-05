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

  def set_default_picture
    if thumbnail == "" || thumbnail.nil?
      self.update(thumbnail: "https://i.ytimg.com/vi/9ZWZ4Aha6eM/sddefault.jpg")
   end
 end
end
