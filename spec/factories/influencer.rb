require 'factory_bot'

FactoryBot.define do
  factory :influencer do
    first_name { 'Harry' }
    last_name { 'Potter' }
    address1 { '124 Raymond Ave' }
    city { 'Poughkeepsie' }
    state { 'NY' }
    zip { '12604' }
    email { 'dolphins' + rand(1..5).to_s + '@test.com' }
    bra_size { }
    top_size { 'S' }
    bottom_size { 'M' }
    sports_jacket_size { 'S' }
    three_item { true }
  end
end
