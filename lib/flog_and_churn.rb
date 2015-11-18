require 'rake'
require 'json'
require 'flog_and_churn/flogger'
require 'flog_and_churn/churner'
require 'flog_and_churn/scores_builder'

class FlogAndChurnRunner

  class << self

    def run
      flog = FlogAndChurn::Flogger.new.score_files
      churn = FlogAndChurn::Churner.new.score_files
      scores = FlogAndChurn::ScoresBuilder.combine(flog, churn)

      puts scores.top_ten

      FileUtils.rm_rf 'reports'
      FileUtils.mkdir 'reports'

      copy_assets
      write_scores(scores)
    end

    private

    def copy_assets
      FileUtils.cp_r Dir["#{File.dirname(__FILE__)}/../assets/*"], 'reports/'
    end

    def write_scores(scores)
      File.write('reports/data.js', "onPageLoad(#{scores.top_ten.to_json});")
    end

  end

end
