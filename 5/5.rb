f = File.open('test.txt')
polymer = ""
f.each_char{|c| polymer += c}
polymer.strip!
puts polymer.length

def runRound(p)
	a = p[0]
	ret = ""
	p[1..-1].each_char do |c|
		diff = a.bytes[0] - c.bytes[0]
		if diff == 32 or diff == -32
			# skip
			a = '1'
		else
			ret += a if a != '1'
			a = c
		end
	end
	ret += a if a != '1'
	return ret
end

len = polymer.length
p = runRound(polymer)
while (len != p.length)
	len = p.length
	p = runRound(p)
end

#puts p
puts p.length 


