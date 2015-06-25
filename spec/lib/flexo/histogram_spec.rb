require "spec_helper"

describe Flexo::Histogram do

  describe "#range" do
    context "when range is provided as an argument" do
      before do
        @histogram = Flexo::Histogram.new([1, 2, 3, 4, 5], :range => 2..5)
      end

      it "constructs the range based on the min and max of the dataset" do
        expect(@histogram.range).to eq(2..5)
      end
    end

    context "when the range is not provided" do
      before do
        @histogram = Flexo::Histogram.new([1, 2, 3, 4, 5])
      end

      it "constructs the range based on the min and max of the dataset" do
        expect(@histogram.range).to eq(1..5)
      end
    end
  end

  describe "#bin_size" do
    context "when bin_size is provided as an argument" do
      it "constructs the range based on the min and max of the dataset" do
        histogram = Flexo::Histogram.new([1, 2, 3, 4, 5], :bin_size => 2)
        expect(histogram.bin_size).to eq(2)
      end
    end

    context "when the bin_size is not provided" do
      it "constructs the range based on the min and max of the dataset" do
        histogram = Flexo::Histogram.new([1, 2, 3, 4, 5])
        expect(histogram.bin_size).to eq(Math.sqrt(5))
      end
    end
  end

  describe "#bin_count" do
    it "returns the number of bins in the range" do
      histogram = Flexo::Histogram.new([1, 2, 3, 4, 5], :bin_size => 2)
      expect(histogram.bin_count).to eq(3)
    end
  end

  describe "#intervals" do
    context "when intervals are provided as an argument" do
      it "constructs the range based on the min and max of the dataset" do
        histogram = Flexo::Histogram.new([1, 2, 3, 4, 5], :intervals => [1...3, 3...5])
        expect(histogram.intervals).to eq [1...3, 3...5]
      end
    end

    context "when intervals are not provided" do
      it "uses the default bin_size and default range" do
        histogram = Flexo::Histogram.new([1, 2, 3, 4])
        expect(histogram.intervals).to eq([1...3, 3...5])
      end

      context "when bin_size is provided" do
        it "constructs the range based on the min and max of the dataset" do
          histogram = Flexo::Histogram.new([1, 2, 3, 4, 5], :bin_size => 2)
          expect(histogram.intervals).to eq([1...3, 3...5, 5...7])
        end
      end

      context "when bin_size and range are provided" do
        it "constructs the range based on the min and max of the dataset" do
          histogram = Flexo::Histogram.new([1, 2, 3, 4, 5], :bin_size => 2, :range => 1..10)
          expect(histogram.intervals).to eq([1...3, 3...5, 5...7, 7...9, 9...11])
        end
      end
    end
  end
end
