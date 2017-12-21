FactoryBot.define do
  factory :influencer do
    first_name { 'Harry' }
    last_name { 'Potter' }
    address1 { '124 Raymond Ave' }
    city { 'Poughkeepsie' }
    state { 'NY' }
    zip { '12604' }
    email { Faker::Internet.safe_email }
    bra_size { 'S' }
    top_size { 'S' }
    bottom_size { 'M' }
    sports_jacket_size { 'S' }
    three_item { true }
  end
end
