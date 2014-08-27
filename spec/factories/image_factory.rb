FactoryGirl.define do
  factory :image do
    id { SecureRandom.hex }
    tags {  Faker::Lorem.words(rand(3)) }
    exposed_ports { ['80/tcp'] }
    volumes { ['/data'] }
  end
end