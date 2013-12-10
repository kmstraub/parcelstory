class Book < ActiveRecord::Base
  belongs_to :user
  has_many :libraries
  has_many :parcels, through: :libraries
  has_many :stories, dependent: :destroy
end
