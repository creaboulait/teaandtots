class Playdate < ApplicationRecord
	belongs_to :user
	has_many :participations, dependent: :destroy

	validates :title, presence: true
	validates :description, presence: true
	validates :location, presence: true
	validates :address, presence: true
	validates :datetime, presence: true
end

