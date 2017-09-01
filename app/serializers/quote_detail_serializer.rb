class QuoteDetailSerializer < ActiveModel::Serializer
  attributes :id,:quote_no,:cost,:discount,:total_cost,:status,:user_id,:currency_type_id,:project_detail_id
	belongs_to :project_detail

	belongs_to :project_type
  
end
