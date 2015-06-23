require "spec_helper"

describe Flexo::Histograms do

  before do
    @dataset = Flexo::DataSet.new([1, 2, 3, 4, 5])
  end

  describe "#histogram" do
    before do
      @ranges = [0.0..3.0, 3.0..5.0]
    end

    it "returns histogram for the provided ranges" do
      expect(@dataset.histogram(@ranges)).to eq({
        0.0..3.0 => 3,
        3.0..5.0 => 3
      })
    end
  end

  describe "#linear_histogram" do
    it "returns a histogram for constant interval sizes" do
      expect(@dataset.linear_histogram :interval => 2).to eq({
        0.0...2.0 => 1,
        2.0...4.0 => 2,
        4.0..5.0 => 2
      })
    end
  end

  describe "#binary_histogram" do
    it "returns a histogram for geometricaly increasing intervals for base 2" do
      expect(@dataset.binary_histogram).to eq({
        0.0...1.0 => 0,
        1.0...3.0 => 2,
        3.0..5.0 => 3
      })
    end
  end
end
