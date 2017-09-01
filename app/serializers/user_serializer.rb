class UserSerializer < ActiveModel::Serializer
  attributes :id ,:name, :email_id, :address, :mobile_no, :user_type_id, :user_role_id, :company_name, :business_details
  belongs_to :user_type
  belongs_to :user_role
end

