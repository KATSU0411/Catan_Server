FactoryBot.define do
  factory :user_session do
    active { false }
    association :user, factory: :user

    trait :activate do
      active { true }
    end
  end
end
