require 'flog_and_churn/scores'

module FlogAndChurn

  class ScoresBuilder

    def self.combine(*data_points)
      combined_data = data_points.flatten.map(&:to_hash)
      raw_combined_result = combined_data.reduce do |memo, el|
        memo.merge(el) { |k,new_val,old_val| new_val + old_val }
      end

      clean_result = raw_combined_result.map do |k,v|
        values_hash = v.reduce { |memo, el| memo.merge(el) }
        { file: k }.merge(values_hash)
      end

      Scores.new(clean_result)

    end

  end

end
