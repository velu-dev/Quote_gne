class ProjectDetailSerializer < ActiveModel::Serializer
  attributes :id,:project_name,:description,:status,:user_id,:project_type_id,:created_at
	belongs_to :user
end
