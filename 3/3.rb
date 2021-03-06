f = File.open('data.txt')

@SIZE = 1100

$fabric = []
for i in 0..@SIZE
	$fabric[i] = []
	for j in 0..@SIZE
		$fabric[i][j] = 0
	end
end

$ids = []
f.each_line do |l|
	id = l.split('@')[0]
	dimens = l.split('@')[1].split(":")
	tl = dimens[0].split(",")
	wh = dimens[1].split("x")
	d = [tl[0].to_i, tl[1].to_i, 
			 wh[0].to_i + tl[0].to_i - 1, 
			 wh[1].to_i + tl[1].to_i - 1]
	$ids << [id, d[0], d[1], d[2], d[3]]

	for l in d[0]..d[2]
		for h in d[1]..d[3]
			$fabric[l][h] += 1
		end
	end
end

$overlap = 0
for i in 0..@SIZE
	for j in 0..@SIZE
		$overlap += 1 if $fabric[i][j] > 1
	end
end

#puts $fabric.inspect
puts $overlap

$ids.each do |i|
	is_good = true
	for l in i[1]..i[3]
		for h in i[2]..i[4]
			if $fabric[l][h] != 1
				is_good = false
				break
			end
		end
	end
	puts i[0] if is_good
end
