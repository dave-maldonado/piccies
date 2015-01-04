FactoryGirl.define do
  factory :picture do
    album
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app', 'assets', 'images', 'default.png')) }
    caption 'such fun!'
    description 'amaze'
  end
end
