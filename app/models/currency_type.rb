class CurrencyType < ApplicationRecord
	has_many :quote_details
	has_many :process_details
end
