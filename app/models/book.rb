class Book < ActiveRecord::Base
  belongs_to :user
  belongs_to :parcel
  has_many :stories, dependent: :destroy
end
