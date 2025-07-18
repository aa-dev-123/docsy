class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :document

  validates :title, :description, :price, presence: true

  default_scope { order(id: :desc) }

  after_create_commit -> { broadcast_prepend_to "articles", partial: "articles/article", locals: { article: self }, target: "articles" }
  after_update_commit -> { broadcast_replace_to "articles", partial: "articles/article", locals: { article: self } } # DEFAULT target is model.plural which is definately the case here
  after_destroy_commit -> { broadcast_remove_to "articles" }
end
