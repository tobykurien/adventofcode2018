d = []
f = File.open('data.txt')
f.each_line{|line| d << line.to_i}
puts d.sum()

acc = 0
dup = nil
seen = {0=>true}

while not dup
	d.each do |v|
		i = v + acc
		acc += v
		if seen[i]
			dup = i
			puts dup
			return
		end
		seen[i] = true
	end
end

