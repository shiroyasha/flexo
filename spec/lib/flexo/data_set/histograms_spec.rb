require "spec_helper"

describe Flexo::DataSet::Histograms do

  before do
    @dataset = Flexo::DataSet.new([1, 2, 3, 4, 5])
  end

  describe "#histogram" do
    it "creates an instance of 'Flexo::Histogram'" do
      expect(@dataset.histogram).to be_instance_of(Flexo::Histogram)
    end
  end

end
