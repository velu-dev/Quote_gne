class UserTypeSerializer < ActiveModel::Serializer
  attributes :id, :type_name, :description
end
