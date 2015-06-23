require "flexo/version"

module Flexo
  require "flexo/ranges"

  class DataSet
    require "flexo/data_set/means"
    require "flexo/data_set/extremes"
    require "flexo/data_set/histograms"
    require "flexo/data_set/aggregations"
    require "flexo/data_set/dispersion"

    include Aggregations
    include Extremes
    include Means
    include Histograms
    include Dispersion

    attr_reader :data

    def initialize(data)
      @data = data.map(&:to_f).freeze
    end

    def size
      @data.length.to_f
    end
  end
end
