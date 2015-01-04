require 'faker'

FactoryGirl.define do
  factory :album do
    name "#{Faker::Name.name}'s Amazing Vacation!"
    description 'wow, such relax.'
  end
end
