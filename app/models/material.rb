class Material < ApplicationRecord
	validates :material_name, presence: {message:'不可为空！'}
	validates :material_name, uniqueness: { message: "已存在" }
	
	validates :material_code, presence: {message:'不可为空！'}
	validates :material_code, uniqueness: { message: "已存在" }

	validates :after_tax, presence: {message:'不可为空！'}
	validates :lower_num, presence: {message:'不可为空！'}

	belongs_to :user

	before_save :default_values

	def default_values
	  self.lower_num ||= 0
	end

	def name_with_unit
	  return "#{self.material_name} (#{self.unit})"
	end

end