require 'std_names_hash'
require 'std_names_sqlite3'
puts "exact match:"
['SUPERCUTS 90198','SUPERCUTS 90250','SUPERCUTS 90471','SUPERCUTS 9765','QUIZNOS CLASSIC SUBS'].each{|business_name|
	puts "hash:    #{STD_NAME[business_name][0]}" ; puts "sqlite3: #{std_names(business_name)[0]}"
}
puts "using like (or fake like):"
puts "Using sqlite3:"
puts std_names_with_like('PERC')[0]
puts std_names_with_like('PERCUTS 9')[0]
puts "Using array, detect method and regular expresion:"
puts std_names_fake_like('PERC')[0]
puts std_names_fake_like('PERCUTS 9')[0]

