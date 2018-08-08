class Playdate < ApplicationRecord
	belongs_to :user
	has_many :participations, dependent: :destroy

	scope :playdate_search, -> (playdate_location) { where("location ILIKE ?", "#{playdate_location}%") }

	validates :title, presence: true
	validates :description, presence: true
	validates :location, presence: true
	validates :address, presence: true
	validates :datetime, presence: true
end

