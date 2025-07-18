class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :document

  validates :title, :description, :price, presence: true

  default_scope { order(id: :desc) }

  after_create_commit -> { broadcast_prepend_to "articles", partial: "articles/article", locals: { article: self }, target: "articles" }
end
