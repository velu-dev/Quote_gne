class ProjectType < ApplicationRecord
	has_many :project_details
	has_many :quote_details

def self.dashboard_process(params)
	board_type = params[:type].present? ? ProjectType.find(params[:type].to_i) : ProjectType.find(1)
	approval = board_type.quote_details.where(status: true)
	unapproval = board_type.quote_details.where(status: false)
	data= {
		:project_type=>board_type,
		:approve => approval,
		:unapproval => unapproval,
		:total_quotes => approval.count+unapproval.count,
		:approval_quotes=> approval.count,
		:unapproval_quotes=> unapproval.count

	}
end

end
