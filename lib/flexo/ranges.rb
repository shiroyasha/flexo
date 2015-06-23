module Flexo
  module Ranges
    extend self

    def constant_interval_ranges(from, to, interval)
      arithmetic_interval_ranges(from, to, interval, 1)
    end

    def arithmetic_interval_ranges(from, to, interval, factor)
      return [] if from > to

      from = from.to_f
      to = to.to_f

      ranges = []

      while from + interval < to
        ranges << (from...from+interval)

        from += interval
        interval *= factor
      end

      ranges << (from..to)

      ranges
    end

    def geometric_interval_ranges(from, to, base)
      return [] if from > to

      from = from.to_f
      to = to.to_f
      interval = 1.0

      ranges = []

      while from + interval < to
        ranges << (from...from+interval)

        from += interval
        interval *= base
      end

      ranges << (from..to)

      ranges
    end

  end
end
