FactoryGirl.define do
  factory :image do
    id { SecureRandom.hex }
    tags {  Faker::Lorem.words(rand(3)) }
  end
end