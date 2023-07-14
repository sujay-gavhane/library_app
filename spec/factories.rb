FactoryBot.define do
  factory(:user) do
    full_name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory(:library) do
    name { Faker::Name.name }
    description { Faker::Quote.matz }
    location { Faker::Address.full_address }
  end

  factory(:book) do
    name { Faker::Name.name }
    description { Faker::Quote.matz }
    status { 'available' }
  end
end