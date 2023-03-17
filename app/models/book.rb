class Book < ApplicationRecord
  belongs_to :publisher
  has_many :authorships, dependent: :destroy
  has_many :authors, through: :authorships
end
