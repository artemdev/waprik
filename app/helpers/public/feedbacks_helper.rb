module Public::FeedbacksHelper

	def translate_category_for object
		if object.category == "wish"
			"пожелание"
		elsif object.category == "thank"
			"благодарность"
		elsif object.category == "warn"
			"жалоба"
		else
			"другое"
		end
	end

end
