class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :document

  validates :title, :description, :price, presence: true

  default_scope { order(id: :desc) }

  # `broadcast_replace_later_to` and `broadcast_prepend_later_to` methods send the msg asyncroniously as compared to `broadcast_prepend_to` and `broadcast_replace_to`
  after_create_commit -> { broadcast_prepend_later_to "articles", partial: "articles/article", locals: { article: self }, target: "articles" }
  after_update_commit -> { broadcast_replace_later_to "articles", partial: "articles/article", locals: { article: self } } # DEFAULT target is model.plural which is definately the case here
  after_destroy_commit -> { broadcast_remove_to "articles" }

  # synthatic sugar syn tax for the above 3 lines in 1 line
  # broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend
end
