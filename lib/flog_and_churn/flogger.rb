require 'flog'
require 'flog_and_churn/data_point'

module FlogAndChurn

  class Flogger

    def initialize(flog_options = {})
      @flogger = Flog.new({continue: true}.merge(flog_options))
    end

    def score_files
      files = Dir['**/**.rb'].reject {|f| f =~ /^tmp\/|^db\//}
      files.map do |f|
        DataPoint.new(
          file_path: f,
          metric: :flog,
          value: score_for_file(f)
        )
      end
    end

    def score_for_file(filename)
      @flogger.reset
      @flogger.flog filename
      @flogger.total_score
    end

  end

end
