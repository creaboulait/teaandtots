class Kid < ApplicationRecord
	belongs_to :user

	validates :name, presence: true
	validates :age, presence: true
	validates :gender, presence: true
end
