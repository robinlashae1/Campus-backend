class UserServiceSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers 
  attributes :id, :name, :description, :price, :user_id, :service_id, :school_id, :service_category_id, :image

belongs_to :user
belongs_to :service
belongs_to :school
belongs_to :service_category

def image
  if object.image.attached?
  {
    url: rails_blob_url(object.image,only_path: true),
    signed_id: object.image.signed_id
  }
  end
end
end
# , disposition: "attachment" ,if object.image.attached?
    # {url: rails_blob_path(object.image,only_path: true)}