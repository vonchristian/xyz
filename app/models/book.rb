class Book < ApplicationRecord
  include PgSearch::Model
  monetize :price_cents, as: :price
  pg_search_scope :text_search, against: [:title, :isbn_10, :isbn_13, :edition, :publication_year],
                  using: {
                    :trigram => {},
                    :dmetaphone => {},
                    :tsearch => { :prefix => true }
                }
  belongs_to :publisher
  has_many :authorships, dependent: :destroy
  has_many :authors, through: :authorships

  validates :title, :price_cents, presence: true

  delegate :name, to: :publisher, prefix: true

  def authors_name
    authors.full_names
  end
end
