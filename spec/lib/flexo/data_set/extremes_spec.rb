require "spec_helper"

describe Flexo::DataSet::Extremes do

  before do
    @dataset = Flexo::DataSet.new([1, 2, 3, 4, 5])
  end

  describe "#maximum" do
    it "returns the largest element in the dataset" do
      expect(@dataset.maximum).to eq(5.0)
    end
  end

  describe "#minimum" do
    it "returns the smallest element in the dataset" do
      expect(@dataset.minimum).to eq(1.0)
    end
  end

end
