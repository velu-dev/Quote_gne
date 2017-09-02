require "byebug"
class QuoteDetail < ApplicationRecord
	belongs_to :project_detail
	belongs_to :project_type
	belongs_to :user

	def self.invoice_process(params)
		board_type =params[:type].present? ? QuoteDetail.where(project_type_id: params[:type].to_i) : QuoteDetail.all
		approval = board_type.where(status: true)
		unapproval = board_type.where(status: false)
		latest = board_type.order(:id).where(status: true).last(2)
		data =[] 
			board_type.map do|board|
				project_detail = board.project_detail
				user_detail = board.project_detail.user
		data<< {
			:quote=> board,
			:project_detail => project_detail,
			:process_detail=> ProcessDetail.all.select { |m| m.project_detail.include?(project_detail.id) },
			:user_detail =>  {:name=>user_detail.name,:email=>user_detail.email_id,:address=>user_detail.address,:mobile_no=> user_detail.mobile_no,:user_type=> user_detail.user_type_id,:user_role=> user_detail.user_role_id,:created_at=>user_detail.created_at,:company_name=>user_detail.company_name,:business_details=>user_detail.business_details}
         	}
			end
approval_data=[]	
unapproval_data=[]	
latest_data=[]	
		data={
				:approval_qotes  => approval.map{|ii| approval_data <<{:approveQuote=> ii,:approvalProject=> ii.project_detail,:process_detail=> ProcessDetail.all.select { |m| m.project_detail.include?(ii.project_detail.id) },:approvaluser=> {:name=>ii.user.name,:email=>ii.user.email_id,:address=>ii.user.address,:mobile_no=> ii.user.mobile_no,:user_type=> ii.user.user_type_id,:user_role=> ii.user.user_role_id,:created_at=>ii.user.created_at,:company_name=>ii.user.company_name,:business_details=>ii.user.business_details}}},
				:unapproval_quotes => unapproval.map{|ii| unapproval_data <<{:unapproveQuote=> ii,:unapprovalProject=> ii.project_detail,:process_detail=> ProcessDetail.all.select { |m| m.project_detail.include?(ii.project_detail.id) },:unapprovaluser=>{:name=>ii.user.name,:email=>ii.user.email_id,:address=>ii.user.address,:mobile_no=> ii.user.mobile_no,:user_type=> ii.user.user_type_id,:user_role=> ii.user.user_role_id,:created_at=>ii.user.created_at,:company_name=>ii.user.company_name,:business_details=>ii.user.business_details}}},
				:latest=>latest.map{|ii| latest_data <<{:latestQuote=> ii, :latestProject=> ii.project_detail,:process_detail=> ProcessDetail.all.select { |m| m.project_detail.include?(ii.project_detail.id) },:latestuser=>{:name=>ii.user.name,:email=>ii.user.email_id,:address=>ii.user.address,:mobile_no=> ii.user.mobile_no,:user_type=> ii.user.user_type_id,:user_role=> ii.user.user_role_id,:created_at=>ii.user.created_at,:company_name=>ii.user.company_name,:business_details=>ii.user.business_details}}},
				:quote=>data,
				:all => QuoteDetail.where(status: false).as_json(include: :project_detail,include: :user)
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
