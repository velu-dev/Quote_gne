require "byebug"
class QuoteDetail < ApplicationRecord
	belongs_to :project_detail
	belongs_to :project_type




	def self.invoice_process(params)
	
	end

end
