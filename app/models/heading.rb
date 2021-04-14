class Heading < ApplicationRecord
  belongs_to :member, optional: true

  validates :member_id, presence: true
  validates :content, presence: true
end
