class Product < ApplicationRecord

	validates :material_name, presence: {message:'不可为空！'}
	validates :material_name, uniqueness: { message: "已存在" }
	
	validates :material_code, presence: {message:'不可为空！'}
	validates :material_code, uniqueness: { message: "已存在" }

	belongs_to :user
	has_many :productItems

	before_save :default_values

	def default_values
	  self.lower_num ||= 0
	end

	def name_with_unit
	  return "#{self.material_name} (#{self.unit})"
	end

	def after_tax
	  totle = 0;
	  self.productItems.each{ |item|
	  	totle += item.num * item.material.after_tax
	  }
	  return totle
	end
	
end
