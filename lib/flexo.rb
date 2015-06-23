require "flexo/version"

require "flexo/means"
require "flexo/extremes"
require "flexo/histograms"
require "flexo/ranges"
require "flexo/aggregations"

module Flexo
  class DataSet
    include Aggregations
    include Extremes
    include Means
    include Histograms

    def initialize(data)
      @data = data.map(&:to_f).freeze
    end

    def size
      @data.length.to_f
    end
  end
end
