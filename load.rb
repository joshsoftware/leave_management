
require 'config/environment.rb'
require 'mysql'

system('nohup ruby script/generate leave_migration &')
sleep(5)
system("nohup rake RAILS_ENV=#{RAILS_ENV} db:migrate &")

mysql = Mysql.init()

# change  the mysql connection parameters accordingly
dbconfig = ActiveRecord::Base.configurations[RAILS_ENV] 

mysql.connect(dbconfig['host'], dbconfig['username'], dbconfig['password'], dbconfig['database'])

mysql.query("update extensions set entry_point = '/leave_management' where id = #{ARGV} ;")

mysql.close()

