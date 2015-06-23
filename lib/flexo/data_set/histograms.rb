module Flexo::DataSet::Histograms
  def histogram(ranges)
    counts = ranges.map do |range|
      @data.count { |el| range.cover?(el) }
    end

    Hash[ranges.zip(counts)]
  end

  def linear_histogram(interval:)
    histogram(Flexo::Ranges.constant_interval_ranges(0, maximum, interval))
  end

  def binary_histogram
    histogram(Flexo::Ranges.geometric_interval_ranges(0, maximum, 2))
  end
end
