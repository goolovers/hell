# 用户管理类，user_type:0->超级管理员;1->管理用户；2->普通用户
class User < ApplicationRecord

	validates :user_code, presence: {message:'不可为空！'}
	validates :user_code, uniqueness: { message: "用户名已存在" }
	validates :user_name, presence: {message:'不可为空！'}
	validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: "只能包含数字或字母！" }
end
