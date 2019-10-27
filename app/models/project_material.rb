class ProjectMaterial < ApplicationRecord
	belongs_to :material
	before_save :default_values

	def default_values
	  self.need_num ||= 0
	  self.stock_num ||= 0
	  self.project_num ||= 0
	end
end
