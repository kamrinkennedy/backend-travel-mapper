class Activity < ApplicationRecord
  belongs_to :destination
  validates :name, presence: true
end
