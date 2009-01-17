require 'benchmark'
puts 'load time:'
Benchmark.bm do |x|
	x.report("hash:   ")   { require 'std_names_hash'}
	x.report("sqlite3:") {require 'std_names_sqlite3'}
end
data = []
File.new('test_data.csv','r').each{|line| data.push line.split('","',-1)[9] if line.split('","',-1)[9]}
puts "exact match (test data #{data.length} rows):"
Benchmark.bm do |x|
	x.report("hash:   "){
		data.each{|bus_name| STD_NAME[bus_name]}
	}
	x.report("sqlite3:"){
		data.each{|bus_name| std_names bus_name}
	}
end
puts "match using like (test data #{data[0..99].length} rows):"
Benchmark.bm do |x|
	x.report("hash:   "){
		data[0..99].each{|bus_name| std_names_fake_like(bus_name)}
	}
	x.report("sqlite3:"){
		data[0..99].each{|bus_name| std_names_with_like(bus_name)}
	}
end

@dbh.disconnect

