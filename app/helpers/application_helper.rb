module ApplicationHelper
  def full_title(page_title = '')
    base_title = "仓储管理系统 V1.0"
    if page_title.empty?
      base_title
    else
      page_title + "|" + base_title
	end
  end
end
