module Flexo
  module Means
    def arithmetic_mean
      sum / size
    end

    def geometric_mean
      product ** (1/size)
    end

    def harmonic_mean
      size / @data.map { |el| 1/el }.inject(0, :+)
    end
  end
end
