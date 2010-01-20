require 'config/environment.rb'
require 'mysql'

system('nohup ruby script/generate leave_migration &')
system('nohup rake db:migrate RAILS_ENV=production &')

mysql = Mysql.init()

# change  the mysql connection parameters accordingly
mysql.connect('localhost', 'ejosh', 'josh123@', 'eJosh')

mysql.query("update extensions set entry_point = '/leave_management' where id = #{ARGV} ;")

mysql.close()

