class PCode < ApplicationRecord
	validates :type_code, presence: {message:'不可为空！'}
	validates :code, presence: {message:'不可为空！'}
	validates :name, presence: {message:'不可为空！'}
end
