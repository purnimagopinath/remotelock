require 'time'
module Services
	class DataSorter
		DEFAULT_ORDER = 'first_name'
		def sort people, sort_order
			sorting_key = sort_order || PatternConstants::DEFAULT_ORDER
			format_sort(people.sort_by{|k| k[sorting_key.to_s]})
		end

		private

		def format_sort people
			info = []
			people.each do |people_info|
				data = []
				PatternConstants::OUTPUT_ATTRIBUTES.each do |attribute|
					if attribute == "birthdate"
						data << Time.parse(people_info[attribute]).strftime("%-m/%-d/%Y")
					else
						data << people_info[attribute]
					end
				end
				info << data.join(", ")
			end
			info
		end

		

	end
end