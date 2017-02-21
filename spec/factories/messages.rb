FactoryGirl.define do

  factory :message do
    image      { Faker::File.file_name('path/to') }
    body       { Faker::Pokemon.name }
    user_id    { Faker::Number.number(1) }
    group_id   { Faker::Number.number(1) }
  end

end
