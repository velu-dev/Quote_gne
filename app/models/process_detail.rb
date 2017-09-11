class ProcessDetail < ApplicationRecord
	belongs_to :uom_detail
	belongs_to :currency_type
	has_many :service_details
end
