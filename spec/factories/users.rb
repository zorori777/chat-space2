FactoryGirl.define do

  password = Faker::Internet.password

  factory :user do
    name                     { Faker::Pokemon.name }
    email                    { Faker::Internet.email }
    password                 password
    password_confirmation    password
  end
end
