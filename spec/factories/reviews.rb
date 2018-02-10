FactoryBot.define do
  factory :review do
    body "This book is amazing."
    user { create :user }
    book { create :book, user: user }
  end
end
