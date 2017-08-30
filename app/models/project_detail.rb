class ProjectDetail < ApplicationRecord
	belongs_to :project_type
	has_many :quote_details
	belongs_to :user
end
