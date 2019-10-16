module UsersHelper
	def full_title(page_title = '')
		page_title.empty? ? "系统管理  /  用户管理" : "系统管理  /  用户管理  /  #{page_title}"
	end
end
