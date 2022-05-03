class Service < ApplicationRecord
    has_many :user_services
    has_many :service_categories
end
