class User < ActiveRecord::Base

	has_secure_password
	has_many :posts, dependent: :destroy
	has_many :parcels, dependent: :destroy
	has_many :stories, dependent: :destroy
	has_many :books, dependent: :destroy
	has_many :events
end
