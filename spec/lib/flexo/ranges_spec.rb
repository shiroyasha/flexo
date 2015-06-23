require "spec_helper"

describe Flexo::Ranges do

  describe "#constant_interval_range" do
    it "creates ranges with a constant size" do
      ranges = Flexo::Ranges.constant_interval_ranges(0, 10, 3)

      expect(ranges).to eq([0...3, 3...6, 6...9, 9..10])
    end

    context "interval is bigger than the whole range" do
      it "creates one range that contains the whole incoming range" do
        ranges = Flexo::Ranges.constant_interval_ranges(0, 10, 15)

        expect(ranges).to eq([0..10])
      end
    end

    context "interval divides the incoming range" do
      it "creates one range that contains the whole incoming range" do
        ranges = Flexo::Ranges.constant_interval_ranges(0, 10, 5)

        expect(ranges).to eq([0...5, 5..10])
      end
    end
  end

  describe "#arithmetic_interval_ranges" do
    it "creates ranges that increase by the provided factor" do
      ranges = Flexo::Ranges.arithmetic_interval_ranges(0, 10, 1, 2)

      expect(ranges).to eq([0...1, 1...3, 3...7, 7..10])
    end
  end

  describe "#geometric_interval_ranges" do
    it "creates ranges that increase like a geometric series" do
      ranges = Flexo::Ranges.geometric_interval_ranges(0, 100, 3)

      expect(ranges).to eq([0.0...1.0, 1.0...4.0, 4.0...13.0, 13.0...40.0, 40.0..100.0])
    end
  end

end
