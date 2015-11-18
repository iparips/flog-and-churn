require 'json'
require 'flog_and_churn'

desc 'flog and churn, only works when git is on master'
task :flog_and_churn do
  FlogAndChurnRunner.new(output_dir: 'reports').run
end

