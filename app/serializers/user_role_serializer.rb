class UserRoleSerializer < ActiveModel::Serializer
  attributes :id,:role_name, :description
end
