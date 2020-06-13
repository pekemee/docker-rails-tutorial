FactoryBot.define do
  factory :micropost do
    content {"test"}
    association :user
  end
end
