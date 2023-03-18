# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

joel = Author.find_or_create_by(first_name: "Joel", last_name: "Hartse")
hannah = Author.find_or_create_by(first_name: "Hannah", middle_name: "P.", last_name: "Templer")
marguerite = Author.find_or_create_by(first_name: "Marguerite", middle_name: "Z.", last_name: "Duras")
kingsley = Author.find_or_create_by(first_name: "Kingsley", last_name: "Amis")
fannie = Author.find_or_create_by(first_name: "Fannie", middle_name: "Peters", last_name: "Flagg")
camille = Author.find_or_create_by(first_name: "Camille", middle_name: "Byron", last_name: "Paglia")
rainer = Author.find_or_create_by(first_name: "Rainer", middle_name: "Steel", last_name: "Rilke")

paste = Publisher.find_or_create_by(name: "Paste Magazine")
publisher_weekly = Publisher.find_or_create_by(name: "Publishers Weekly")
graywolf = Publisher.find_or_create_by(name: "Graywolf Press")
mcsweeney = Publisher.find_or_create_by(name: "McSweeney's")

elf = Book.find_or_create_by(title: "American Elf", isbn_13: "978-1-891830-85-3", isbn_10: "1-891-83085-6", publication_year: 2004, publisher: paste, edition: "Book 2", price_cents: 100000)
elf.authorships.find_or_create_by(author: joel)
elf.authorships.find_or_create_by(author: hannah)
elf.authorships.find_or_create_by(author: marguerite)


cosmo = Book.find_or_create_by(title: "Cosmoknights", isbn_13: "978-1-60309-454-2", isbn_10: "1-603-09454-7", publication_year: 2019, publisher: publisher_weekly, edition: "Book 1", price_cents: 200000)
cosmo.authorships.find_or_create_by(author: kingsley)

essex = Book.find_or_create_by(title: "Essex County", isbn_13: "978-1-60309-038-4", isbn_10: "1-603-09038-X", publication_year: 1990, publisher: graywolf, price_cents: 50000)
essex.authorships.find_or_create_by(author: kingsley)

hey = Book.find_or_create_by(title: "Hey, Mister (Vol 1)",  isbn_13: "978-1-891830-02-0", isbn_10: "1-891-83002-3", publication_year: 2000, publisher: graywolf, edition: "After School Special", price_cents: 120000)
hey.authorships.find_or_create_by(author: hannah)
hey.authorships.find_or_create_by(author: fannie)
hey.authorships.find_or_create_by(author: camille)

welder = Book.find_or_create_by(title: "The Underwater Welder", isbn_13: "978-1-60309-398-9", isbn_10: "1-603-09398-2", publication_year: 2022, publisher: mcsweeney, price_cents: 300000)
welder.authorships.find_or_create_by(author: rainer)

