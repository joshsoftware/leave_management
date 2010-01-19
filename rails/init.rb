# Include hook code here
#require 'employee'
ActionController::Base.send(:include, LeaveManagement)

%w{ models controllers helpers }.each do |dir|
  path = File.join(File.dirname(__FILE__), 'app', dir)
  $LOAD_PATH << path
  ActiveSupport::Dependencies.load_paths << path
  ActiveSupport::Dependencies.load_once_paths.delete(path)
#  if RAILS_ENV == 'development'
#  ActiveSupport::Dependencies.load_once_paths.reject!{|x| x =~ /^#{Regexp.escape(File.dirname(__FILE__))}/}
#  end
end 
load_paths.each do |path|
  ActiveSupport::Dependencies.load_once_paths.delete(path)
end if config.environment == 'development'

ActionController::Base.append_view_path(File.join(directory, "app", "views"))
config.controller_paths << lib_path
