### Setup
----
- Clone this repository.
- Install ruby 3.2.1
- Install postgres
- Run `bin/rails db:create db:migrate db:seed` to setup schema and populate seed data

### Frontend Task
You can test a working demo at https://butterfly.xyz-946770.c66.me/
 - Match the provided mockup as closely as possible
 - Provide a seach form to search book (Applied also [trigram](https://github.com/Casecommons/pg_search#trigram-trigram-search) and [dmetaphone](https://github.com/Casecommons/pg_search#trigram-trigram-search) search logic)

### Backend Task
 -  Create both a schema and corresponding classes to represent an author, book, and publisher
 - Provide an API endpoint to display information about a particular book given its ISBN-13 `/api/books/:isbn_13`
 -  Implement an endpoint that converts an ISBN-13 to an ISBN-10 (and vice versa) `/api/isbn_conversions/:isbn`

