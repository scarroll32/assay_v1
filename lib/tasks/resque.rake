# require "resque/tasks"

# task "resque:setup" => :environment do
#   ENV['QUEUE'] = '*'
#   # added to resolve active record / postgres bug
#   # http://stackoverflow.com/questions/10170807/activerecordstatementinvalid-pg-error
#   Resque.before_fork = Proc.new { ActiveRecord::Base.establish_connection }
# end
