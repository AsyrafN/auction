class Product < ApplicationRecord
	include PgSearch
	pg_search_scope :search_by_name, :against => :name
	belongs_to :user

	def self.perform_search(keyword)
		if keyword.present?
		then Product.search_by_name(keyword)
		else Product.all 
		end
	end
end
