namespace :data do
  desc 'Generate Data CSV'
  task csv: :environment do
    require 'csv'
    file_name = Rails.root.join("data-#{Time.zone.now.to_i}.csv")
    CSV.open(file_name, 'w') do |csv|
      csv << %w[
        first_name
        last_name
        job
        address
        date_of_birth
        phone_number
        gender
        email
      ]
      10_000.times.map do
        csv << [
          Faker::Name.first_name,
          Faker::Name.last_name,
          Faker::Job.title,
          Faker::Address.full_address,
          Faker::Date.birthday(min_age: 18, max_age: 65),
          Faker::PhoneNumber.cell_phone,
          Faker::Gender.binary_type,
          Faker::Internet.email
        ]
      end
    end
  end
end
