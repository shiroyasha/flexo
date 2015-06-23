require "spec_helper"

describe Flexo::DataSet::Means do
  before do
    @dataset = Flexo::DataSet.new([1, 2, 3, 4, 5])
  end

  describe "#arithmetic_mean" do
    it "calculates the arithmetic mean for the provided data" do
      expect(@dataset.arithmetic_mean).to eq(3.0)
    end
  end

  describe "#geometric_mean" do
    it "calculates the geometric mean for the provided data" do
      expect(@dataset.geometric_mean).to be_within(0.0001).of(2.6051)
    end
  end

  describe "#harmonic_mean" do
    it "calculates the harmonic mean for the provided data" do
      expect(@dataset.harmonic_mean).to be_within(0.0001).of(2.1897)
    end
  end
end
