class Book < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :text_search, against: [:title, :isbn_10, :isbn_13, :edition, :publication_year],
                  using: {
                    :trigram => {},
                    :dmetaphone => {},
                    :tsearch => { :prefix => true }
                }
  belongs_to :publisher
  has_many :authorships, dependent: :destroy
  has_many :authors, through: :authorships
end
