task seed_data: :environment do
  puts 'Seeding data...'
  Rails.application.load_seed
end
