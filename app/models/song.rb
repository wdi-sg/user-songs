class Song < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  belongs_to :user
end
