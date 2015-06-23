require "spec_helper"

describe Flexo::DataSet do

  before do
    @dataset = Flexo::DataSet.new([1, 2, 3, 4, 5])
  end

  describe "#size" do
    it "returns the number of elements in the dataset" do
      expect(@dataset.size).to eq(5)
    end
  end

end
