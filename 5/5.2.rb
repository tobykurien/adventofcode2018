def removeUnit(u)
	f = File.open('data.txt')
	polymer = ""
	last_c = 0
	f.each_char do |c|
		cur_c = c.bytes[0]
		if cur_c >= 65 and cur_c <= 122 and
				cur_c != u and cur_c != u-32
			if cur_c - last_c == 32 or cur_c - last_c == -32
				# skip
				polymer.chop!
				if polymer.length > 0
					last_c = polymer.bytes.last
				else
					last_c = 0
				end
			else
				polymer += c
				last_c = cur_c
			end
		end
	end
	return polymer.length
end

res = {}
('a'..'z').each do |u|
	res[u] = removeUnit(u.bytes[0])
end

puts res.min_by{|k,v| v}
