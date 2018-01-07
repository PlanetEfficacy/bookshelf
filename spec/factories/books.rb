FactoryBot.define do
  factory :book do
    author
    genre
    title "MyText"
    published "2017-10-30"
    hours 1
    pages 1
    amazon_url "MyString"
    audible_url "MyString"
  end
end
