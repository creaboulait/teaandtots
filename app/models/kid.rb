class Kid < ApplicationRecord
	belongs_to :user
	has_many :participations, dependent: :destroy

	validates :name, presence: true
	validates :age, presence: true
	validates :gender, presence: true
end
