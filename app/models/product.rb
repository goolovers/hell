class Product < ApplicationRecord

	validates :material_name, presence: {message:'不可为空！'}
	validates :material_name, uniqueness: { message: "已存在" }
	
	validates :material_code, presence: {message:'不可为空！'}
	validates :material_code, uniqueness: { message: "已存在" }

	belongs_to :user
	has_many :productItems
	
end
