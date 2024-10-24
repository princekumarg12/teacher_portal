FactoryBot.define do
  factory :student do
    name { "John Doe" }
    subject { "Math" }
    marks { 80 }
    association :teacher
  end
end
