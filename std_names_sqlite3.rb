`sqlite3 test.db "drop table std_names"`
`sqlite3 test.db "create table std_names(std_name TEXT,bus_name TEXT,sic TEXT)"`
`sqlite3 -separator , test.db ".import STD_NAMES_MASTER.csv std_names"`
`sqlite3 test.db "create index au_name_idx on std_names (std_name)"`
require 'dbi'
@dbh = DBI.connect('DBI:SQLite3:test.db', '', '')
def std_names name
 @dbh.select_one("select bus_name,sic from std_names where std_name = '#{name}';") rescue [nil,nil,nil]
end
def std_names_with_like name
 @dbh.select_one("select bus_name,sic from std_names where std_name like '%#{name}%';") rescue [nil,nil,nil]
end
