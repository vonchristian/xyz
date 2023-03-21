# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    association :publisher
    title { Faker::Book.title }
    price_cents { 10000 }
    isbn_13 { Faker::Code.isbn(base: 13) }
    publication_year { Date.current.year }
  end
end
