class Destination < ApplicationRecord
    has_many :activities, dependent: :destroy
end
