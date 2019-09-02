class Book < ApplicationRecord
  has_many :reviews
  belongs_to :user
  has_one_attached :image
end
