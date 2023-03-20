# frozen_string_literal: true

class BookSerializer
  include JSONAPI::Serializer

  attributes :id,
             :title,
             :isbn_13,
             :isbn_10,
             :publication_year,
             :edition,
             :price_cents,
             :authors_name,
             :publisher_name
end
