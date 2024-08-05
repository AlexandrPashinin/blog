FactoryBot.define do
  factory :user do
    name { 'oleg' }
    email { 'oleg@example.com' }
    last_name { 'Ivanov' }
    nik_name { 'olegnik' }
    password { 'password123' }
  end
end
