class Flexo::Histogram

  attr_reader :intervals

  def initialize(data, options = {})
    @data = data.freeze
    @options = options
  end

  def range
    @options[:range] || (@data.min..@data.max)
  end

  def bin_size
    @options[:bin_size] || Math.sqrt(@data.length)
  end

  def bin_count
    ((range.size + 1)/bin_size).floor
  end

  def intervals
    @intervals ||= @options[:intervals] || generate_intervals
  end

  def counts
    @values ||= intervals.map do |range|
      @data.count { |el| range.cover?(el) }
    end
  end

  def percentages
    counts.map { |count| (count.to_f/@data.length) * 100 }
  end

  def table
    intervals_column   = intervals.map(&:to_s)
    percentages_column = percentages.map { |percentage| "#" * (percentage / 2).to_i  }

    intervals_column_width = intervals_column.map(&:length).max

    intervals_column.map! { |interval| interval.rjust(intervals_column_width, " ") }

    intervals_column.zip(percentages_column).each do |pair|
      puts "%s | %s" % pair
    end

    nil
  end

  private

  def generate_intervals
    bin_count.times.map do |index|
      from = range.first + index*bin_size
      to   = range.first + (index+1)*bin_size

      (from...to)
    end
  end

end
