module FlogAndChurn

  class DataPoint

    def initialize(args)
      @file_path = args.fetch(:file_path)
      @metric = args.fetch(:metric)
      @value = args.fetch(:value)
    end

    def to_hash
      { @file_path => [ @metric => @value ] }
    end

  end

end
