require 'rails_helper'
require 'byebug'

RSpec.describe Review, type: :model do
	
	context 'validations' do
		it { is_expected.to validate_presence_of(:title) }
		it { is_expected.to validate_presence_of(:description) }
		it { is_expected.to validate_presence_of(:stars) }
		it { is_expected.to validate_numericality_of(:stars) }
	end

	context 'associations' do
		# Test review-user association 
		it "should belong to user" do 
			review = Review.reflect_on_association(:user)
			expect(review.macro).to eq(:belongs_to)
		end
		
		# Test review-playdate association 
		it "should belong to playdate" do 
			review = Review.reflect_on_association(:playdate)
			expect(review.macro).to eq(:belongs_to)
		end

	end

end