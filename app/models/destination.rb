class Destination < ApplicationRecord
    has_many :activities, dependent: :destroy
    validates :location, :locale, :arrival, :departure, presence: true
end
