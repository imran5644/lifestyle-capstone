class Category < ApplicationRecord
  validates :name, presence: true, length: { mininum: 2, maximum: 20 }
  validates :priority, presence: true, numericality: { only_integer: true }

  has_many :article_categories
  has_many :articles, through: :article_categories, source: :article

  scope :priority_order, -> { order(:priority) }

  def most_recent_article
    articles.most_recents.limit(1)
  end
end
