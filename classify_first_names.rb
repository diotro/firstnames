
# beauvoir library available at
# https://github.com/opengendertracking/beauvoir
require 'beauvoir'
b = Beauvoir::Categorizer.new
lines = 0
not_unknown = 0
File.open(ARGV[0], 'r+') do |file|
	file.each_line do |line| 
		gender_guess = b.guess(line).to_s
		not_unknown += 1 if(gender_guess!="unknown")
                lines += 1
		puts [line, gender_guess, b.estimated_female_value(line), b.estimated_male_value(line)].join(",")
	end
end

puts "===== report ====="
puts "lines: #{lines}"
puts "not unknown: #{not_unknown}"
