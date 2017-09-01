require "byebug"
class QuoteDetail < ApplicationRecord
	belongs_to :project_detail
	belongs_to :project_type




	def self.invoice_process(params)
		byebug
		board_type =params[:type].present? ? QuoteDetail.where(project_type_id: params[:type].to_i) : QuoteDetail.all
		approval = board_type.where(status: true)
		unapproval = board_type.where(status: false)
		latest = board_type.order(:id).last(2)
		data =[] 
			board_type.map do|board|
				project_detail = board.project_detail
				user_detail = board.project_detail.user

		data<< {
			:quote=> board,
			:project_detail => project_detail,
			:user_detail => user_detail
	}
			end
			data={
				:approval_qotes  => approval,
				:unapproval_quotes =>unapproval,
				:quote=>data,
				:latest=> latest

			}
	end
	
	def self.search(params)
		if params
    		data = QuoteDetail.where('quote_no LIKE ?', "%#{params}%")
    		return data
  		else
    		data = QuoteDetail.all
    		return data
  		end
	end

end
