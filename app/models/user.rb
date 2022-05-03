class User < ApplicationRecord
# belongs_to :school
has_many :user_services

has_secure_password   
validates :username, presence: true, uniqueness: true  

has_one_attached :profile_picture
end
