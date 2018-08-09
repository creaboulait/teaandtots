class User < ApplicationRecord
	has_secure_password 

	has_many :kids, dependent: :destroy
	has_many :playdates, dependent: :destroy
	enum role: {user: 0, admin: 1}

	validates :email, presence: { message: "Email must not be blank."},
						uniqueness: { message: "Email has already been used to register account."},
	          format: { with: /\w+@\w+\.\w{2,}/, message: "Email must be in format abc@example.com"} 
	validates :password,
						on: :create,
           	presence: { message: "Password must not be blank."},
           	length: { minimum: 8 }
end
