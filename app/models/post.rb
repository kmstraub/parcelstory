class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :parcel
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
