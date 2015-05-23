module FlogAndChurn

  class Scores

    def initialize(scores)
      @scores = scores.reject do |r|
        r[:flog].nil? || r[:times_changed].nil?
      end
    end

    def raw
      @scores
    end

    def top_ten
      @scores.sort_by do |r|
        [r[:times_changed], r[:flog]]
      end.reverse.take 10
    end

  end

end
