class AdventureCategory < ActiveRecord::Base
	belongs_to :adventure
	belongs_to :category
end
