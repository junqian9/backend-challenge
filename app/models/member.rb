class Member < ApplicationRecord
  has_many :headings

  validates :name, presence: true, uniqueness: true
  validates :website_url, presence: true
end
