module Admin::CollectionsHelper

	def show_date_for date
		if date
			date.strftime("%d.%m.%y")
		else
			"дата не определена"
		end
	end

end
