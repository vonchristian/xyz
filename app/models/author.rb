class Author < ApplicationRecord
  has_many :authorships, dependent: :destroy
  has_many :books, through: :authorships

  def self.full_names
    all.map { |author| author.full_name }.join(", ")
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}".squish
  end
end
