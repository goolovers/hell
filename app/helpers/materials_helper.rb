module MaterialsHelper
	def full_title(page_title = '')
		page_title.empty? ? "基础档案  /  原材料档案" : "基础档案  /  原材料档案  /  #{page_title}"
	end
end
