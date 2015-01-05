require 'faker'

FactoryGirl.define do
  factory :album do
    name "#{Faker::Name.name}'s Amazing Vacation!"
    description 'wow, such relax.'

    factory :album_with_pictures do

      transient do
        pictures_count 10
      end
      after(:create) do |album, evaluator|
        create_list(:picture, evaluator.pictures_count, album: album)
      end
    end
  end
end
