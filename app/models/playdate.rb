class Playdate < ApplicationRecord
	belongs_to :user

	validates :title, presence: true
	validates :description, presence: true
	validates :location, presence: true
	validates :address, presence: true
	validates :datetime, presence: true
end

