class ServiceDetailSerializer < ActiveModel::Serializer
  attributes :id,:service_name,:service_id
 belongs_to :process_detail
 #belongs_to :process_detail

end
