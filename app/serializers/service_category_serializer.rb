class ServiceCategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :service
end
