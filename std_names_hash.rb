STD_NAME = {}
File.new("#{File.dirname(__FILE__)}/STD_NAMES_MASTER.csv",'r').each{|line|
	record = line.gsub(/[\n\r]/,'').split(",",-1)
	STD_NAME[record[0]]=[record[1],record[2]]
}
STD_NAME_FLAT = STD_NAME.to_a
def std_names_fake_like name
	res = STD_NAME_FLAT.detect{|v| v[0] =~ Regexp.new("^.*(#{name}).*$")}
	res||=[nil,[nil,nil]]
	res[1]
end


