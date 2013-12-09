class Parcel < ActiveRecord::Base
	has_many :posts, dependent: :destroy

	extend ::Geocoder::Model::ActiveRecord

	def full_address
		[address, city, state, zip].compact.join(', ')
	end
	geocoded_by :full_address

	after_validation :geocode
	def self.search(search)
		if search
			find(:all, :conditions => ['city LIKE ?', "%#{search}%"])
		else
			find(:all)
		end
	end
	belongs_to :user
	has_many :stories, :through => :books
	has_many :books, dependent: :destroy
	has_many :subscriptions
	has_many :users, through: :subscriptions
end
