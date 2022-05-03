class ServiceCategory < ApplicationRecord
    belongs_to :service
    has_many :user_services
end
