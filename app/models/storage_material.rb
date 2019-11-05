class StorageMaterial < ApplicationRecord
	belongs_to :material
	before_save :default_values

	def default_values
	  self.num ||= 0
	end
end
