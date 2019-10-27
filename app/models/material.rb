class Material < ApplicationRecord
	validates :material_name, presence: {message:'不可为空！'}
	validates :material_name, uniqueness: { message: "已存在" }
	
	validates :material_code, presence: {message:'不可为空！'}
	validates :material_code, uniqueness: { message: "已存在" }

	validates :after_tax, presence: {message:'不可为空！'}

	belongs_to :user

	def name_with_unit
	  return "#{self.material_name} (#{self.unit})"
	end

end