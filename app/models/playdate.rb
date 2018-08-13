class Playdate < ApplicationRecord
	belongs_to :user
	has_many :participations, dependent: :destroy
	has_many :reviews, dependent: :destroy

	scope :playdate_search, -> (playdate_location) { where("location ILIKE ?", "#{playdate_location}%") }

	validates :title, presence: true
	validates :description, presence: true
	validates :location, presence: true
	validates :address, presence: true
	validates :datetime, presence: true
	validate :start_time_in_the_past

	private
	def start_time_in_the_past
    if !self.datetime.blank? && self.datetime < Time.now
    	errors.add(:datetime, "cannot be in the past") 
    end 
  end
end

