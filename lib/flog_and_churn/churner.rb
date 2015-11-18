require 'churn/calculator'
require 'flog_and_churn/data_point'

module FlogAndChurn

  class Churner

    def initialize(chrun_options)
      options = {
        minimum_churn_count: 0,
        ignores: '^tmp/|^db/'
      }.merge(chrun_options)
      @churn_calc = Churn::ChurnCalculator.new(options)
    end

    def score_files
      format_output(calc_scores)
    end

    private

    def calc_scores
      @churn_calc
      .report(false)
      .fetch(:churn)
      .fetch(:changes)
      .select {|rec| rec[:file_path] =~ /.rb$/ }
    end

    def format_output(scores)
      scores.map do |score|
        DataPoint.new(
          file_path: score.fetch(:file_path),
          metric: :times_changed,
          value: score.fetch(:times_changed)
        )
      end

    end

  end

end
