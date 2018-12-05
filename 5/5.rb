f = File.open('data.txt')
polymer = ""
last_c = 0
f.each_char do |c|
	cur_c = c.bytes[0]
  if cur_c >= 65 and cur_c <= 122
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

#puts polymer
puts polymer.length

