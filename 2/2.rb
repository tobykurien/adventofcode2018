d = []
f = File.open('data.txt')
f.each_line{|line| d << line.strip}

twos = 0
threes = 0
d.each do |w|
	letters = {}
	w.each_char do |c|
		if letters[c]
			letters[c] += 1
		else
			letters[c] = 1
		end
	end
	twos += 1 if letters.values.include? 2
	threes += 1 if letters.values.include? 3
end

puts twos
puts threes
puts twos * threes

d.each_with_index do |w1, i|
	d.drop(i).each do |w2|
		diff = w1.chars.zip(w2.chars)
			.count{|a,b| a != b}

		if diff == 1
			puts w1
			puts w2
			common = w1.chars.zip(w2.chars)
				.select{|a| a[0] == a[1]}
				.map{|a| a[0]}
				.join
			puts common
			break
		end
	end
end

