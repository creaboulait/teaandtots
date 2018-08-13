require 'rails_helper'
require 'byebug'

RSpec.describe User, type: :model do
	let(:proper_email)		{ 'hello@hello.com' }
	let(:improper_email)	{ 'hello.com' }
	let(:proper_password)	{ '1234qwer' }
	
	context 'validations' do
		# For email
		it { is_expected.to validate_presence_of(:email) }
		it { is_expected.to validate_uniqueness_of(:email) }
		it { is_expected.to allow_value(proper_email).for(:email) }	
		it { is_expected.not_to allow_value(improper_email).for(:email)  }
		# For password
		it { is_expected.to validate_presence_of(:password) }
		it { is_expected.to validate_length_of(:password) }
		it { is_expected.to allow_value(proper_password).for(:password) }	
	end

	context 'enumurate role' do
		it { should define_enum_for(:role).with([:user, :admin]) }
	end

	context 'associations' do
		# Test user-kids association & dependency
		it "should not belong to kids" do 
			user = User.reflect_on_association(:kids)
			expect(user.macro).to_not eq(:belongs_to)
		end

		it "should be associated to many kids" do 
			user = User.reflect_on_association(:kids)
			expect(user.macro).to eq(:has_many)
		end

		it "should destroy playdates in DB if user is destroyed" do
			user = User.create(email: proper_email, password: proper_password)
			kid_one = Kid.create(name: "one", age: 1, gender: "male", user: user)
			kid_two = Kid.create(name: "two", age: 2, gender: "male", user: user)
			expect { user.destroy }.to change { Kid.count }.by(-2)
		end

		# Test user-playdates association & dependency
		it "should not belong to playdates" do 
			user = User.reflect_on_association(:playdates)
			expect(user.macro).to_not eq(:belongs_to)
		end

		
		it "should be associated to playdates" do 
			user = User.reflect_on_association(:playdates)
			expect(user.macro).to eq(:has_many)
		end

		it "should destroy playdates in DB if user is destroyed" do
			user = User.create(email: proper_email, password: proper_password)
			play_one = Playdate.create(title: "one", description: "one", location: "one", address: "one", datetime: Time.now + 2, user: user)
			play_two = Playdate.create(title: "two", description: "two", location: "two", address: "two", datetime: Time.now + 2, user: user)
			expect { user.destroy }.to change { Playdate.count }.by(-2)
		end

	end

	context 'test report! model method' do
		it "should change the column reported value from default false to true " do
			user = User.create(email: proper_email, password: proper_password)
			user.report!
			expect(user.reported).to eq(true)
		end
	end

	context 'test unreport! model method' do
		it "should change the column reported value from true to false & reported_by_user_id to be nil" do
			user = User.create(email: proper_email, password: proper_password)
			user.unreport!
			expect(user.reported).to eq(false)
			expect(user.reported_by_user_id).to eq(nil)
		end
	end

end