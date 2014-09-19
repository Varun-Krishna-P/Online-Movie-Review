module ApplicationHelper
	def full_title(page_title)
		default_title = "Online Movie Review"
		if page_title.empty?
			default_title
		else
			"#{page_title}"
		end
	end
end
