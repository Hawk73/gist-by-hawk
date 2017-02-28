class Snippet < ApplicationRecord
  belongs_to :user
  validates_presence_of :user

  validates :name, presence: { allow_blank: false }
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
