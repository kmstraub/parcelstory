class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>"}

end
