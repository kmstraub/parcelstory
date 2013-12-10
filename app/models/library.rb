class Library < ActiveRecord::Base
	belongs_to :parcel
	belongs_to :book
end
