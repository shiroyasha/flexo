module Flexo::DataSet::Dispersion
  def variance
    data.inject(0, :+) { |sum, el| (el - arithmetic_mean) ** 2 } / size
  end

  def standard_deviation
    Math.sqrt(variance)
  end

  def mean_absolute_deviation
  end

  def median_absolute_deviation
  end

  def maximum_absolute_deviation
  end
end
