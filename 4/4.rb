require 'time'

f = File.open('data.txt')
$d = []
f.each_line{|l| $d << l.split("]")}
$d = $d.map{|i| [Time.parse(i[0][1..17]), i[1].strip] }
$d = $d.sort_by{|i| i[0]}

guard_logs = {}
id = "?"
t = 0
state = 0 # 0 = awake, 1 = sleep

$d.each do |log|
	if log[1].start_with? "Guard"
		for i in t..59
			guard_logs[id][i] += state
		end if id != "?"

		id = log[1].split(" ")[1][1..-1] 
		guard_logs[id] = Array.new(60, 0) if !guard_logs[id]
		t = 0
		state = 0
	else
		for i in t..(log[0].min - 1)
			guard_logs[id][i] += state
		end

		t = log[0].min
		if log[1].start_with? "wakes"
			state = 0
		else
			state = 1
		end
	end
end

for i in t..59
	guard_logs[id][i] += state
end

longest_sleep = guard_logs.max_by{|i| i[1].sum}[0]
longest_minute = guard_logs[longest_sleep].index(guard_logs[longest_sleep].max)

puts longest_sleep, longest_minute
puts longest_sleep.to_i * longest_minute.to_i

most_frequent = guard_logs.max_by{|i| i[1].max}[0]
freq_minute = guard_logs[most_frequent].index(guard_logs[most_frequent].max)

puts most_frequent, freq_minute
puts most_frequent.to_i * freq_minute.to_i
