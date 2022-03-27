module Services
	require_relative 'pattern_constants'
	class DataNormalization

		def get_data file
			labels, data, label_count = split_data(file)
			format_data(labels, data, label_count)
		end

		private

		def split_data file
			contents = file.split("\n")
			delimiter = get_pattern(contents)
			contents = contents.map{|content| content.split(delimiter)}
			label_count = contents[0].length
			contents = contents.flatten.map{|content| content.strip}
			[contents.shift(label_count), contents, label_count]
		end

		def get_pattern(contents)
			delimiter = ""
			PatternConstants::DELIMITERS.each do |pattern|
				if (contents.map{|row| row.split(" ").include?(pattern)}.uniq[0])
				 	delimiter = pattern
				 end
			end
			delimiter
		end

		def format_data(labels, data, label_count)
			h=[]
			missing_label = PatternConstants::PEOPLE_ATTRIBUTES - labels
			data.each_slice(label_count.to_i) do |people|
				arranged_data = {}
				people.each_with_index do |info, i|
					arranged_data[labels[i]]=info
					missing_label.each do |label|
						arranged_data[label] = ""
					end
				end
				h<<arranged_data
			end
			h
		end

	end
end