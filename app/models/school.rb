class School < ApplicationRecord
    has_many :services
    has_many :users, through: :services
end
