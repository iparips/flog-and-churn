require 'rake'
require 'json'
require 'flog_and_churn/flogger'
require 'flog_and_churn/churner'
require 'flog_and_churn/scores_builder'

class FlogAndChurnRunner

  def self.run
    flog = FlogAndChurn::Flogger.new.score_files
    churn = FlogAndChurn::Churner.new.score_files
    scores = FlogAndChurn::ScoresBuilder.combine(flog, churn)
    puts scores.top_ten
    FileUtils.rm_rf 'reports'
    FileUtils.mkdir 'reports'
    FileUtils.cp_r Dir['lib/metrics/assets/*'], 'reports/'
    File.write('reports/data.js', "onPageLoad(#{scores.top_ten.to_json});")
  end

end
