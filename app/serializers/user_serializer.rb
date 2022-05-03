class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :username, :password, :password_confirmation,:name,:profile_picture,:description, :is_tech

  has_many :user_services

def profile_picture
  if object.profile_picture.attached?
    {url: rails_blob_path(object.profile_picture,only_path: true)}
  end
end
end
