FactoryGirl.define do
  factory :snippets do
    sequence(:name) { |n| "name_#{n}" }
    sequence(:text) { |n| "text_#{n}" }

    user
  end
end
