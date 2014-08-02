module Public::FeedbacksHelper

	def translate_category_for object
		case object.category
			when "wish"
				"пожелание"
			when "thank"
				"благодарность"
			when "warn"
				"жалоба"
		end
	end

end
