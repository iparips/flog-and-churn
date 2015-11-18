require 'rake'
require 'json'
require 'flog_and_churn/flogger'
require 'flog_and_churn/churner'
require 'flog_and_churn/scores_builder'

class FlogAndChurnRunner

  def initialize(args)
    @output_dir = args.fetch(:output_dir)
    @flog_options = args.fetch(:flog_options, {})
    @churn_options = args.fetch(:churn_options, {})
  end

  def run
    flog = FlogAndChurn::Flogger.new(@flog_options).score_files
    churn = FlogAndChurn::Churner.new(@churn_options).score_files
    scores = FlogAndChurn::ScoresBuilder.combine(flog, churn)

    puts scores.top_ten

    FileUtils.rm_rf @output_dir
    FileUtils.mkdir @output_dir

    copy_assets
    write_scores(scores)
  end

  private

  def copy_assets
    FileUtils.cp_r Dir["#{File.dirname(__FILE__)}/../assets/*"], "#{@output_dir}/"
  end

  def write_scores(scores)
    File.write("#{@output_dir}/data.js", "onPageLoad(#{scores.top_ten.to_json});")
  end

end
