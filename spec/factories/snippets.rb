FactoryGirl.define do
  factory :snippets do
    sequence(:name) { |n| "name_#{n}" }
    sequence(:text) { |n| "text_#{n}" }

    user
  end
end

# == Schema Information
#
# Table name: snippets
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  name       :string           not null
#  text       :text
#  settings   :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_snippets_on_user_id  (user_id)
#
