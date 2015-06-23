module Flexo::DataSet::Aggregations
  def sum
    data.inject(0, :+).to_f
  end

  def product
    data.inject(1, :*).to_f
  end
end
