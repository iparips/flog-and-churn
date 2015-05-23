require 'json'
require 'churn/calculator'
require 'flog_and_churn/flogger'
require 'flog_and_churn/churner'
require 'flog_and_churn/scores_builder'

desc 'flog and churn, only works when git is on master'
task :flog_and_churn do
  flog = Flogger.new.score_files
  churn = Churner.new.score_files
  scores = ScoresBuilder.combine(flog, churn)
  puts scores.top_ten
  rm_rf 'reports'
  mkdir 'reports'
  cp_r Dir['lib/metrics/assets/*'], 'reports/'
  File.write('reports/data.js', "onPageLoad(#{scores.top_ten.to_json});")
end

