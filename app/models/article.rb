class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :document

  validates :title, presence: true
end
