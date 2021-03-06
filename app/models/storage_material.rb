class StorageMaterial < ApplicationRecord
	belongs_to :material
	before_save :default_values

	def default_values
	  self.num ||= 0
	end

	def material_name
		self.material.material_name
	end
end
