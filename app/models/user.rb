class User < ApplicationRecord
	has_secure_password 

	has_many :kids, dependent: :destroy
	has_many :playdates, dependent: :destroy
	enum role: {user: 0, admin: 1}

	mount_uploader :profilepic, ProfilepicUploader

	validates :email, presence: true,
						uniqueness: true,
	          format: { with: /\w+@\w+\.\w{2,}/, message: "Email must be in format abc@example.com"} 
	validates :password,
						on: :create,
           	presence: true,
           	length: { minimum: 8 }

  def report!
  		update_attribute(:reported, true)
 	end

end
