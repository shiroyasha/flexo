module Flexo::DataSet::Histograms
  def histogram(options = {})
    Flexo::Histogram.new(data, options)
  end
end
