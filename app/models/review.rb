class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  has_one_attached :avatar
end
