# Flexo

A simple gem for calculating various statistics data, histograms, distributions, etc...

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'flexo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install flexo

## Usage

Start by creating a `DataSet`

``` ruby
set = Flexo::DataSet.new([1, 2, 3, 4, 5])
```

### Mean values

Calculate various kinds of mean values for the provided data:

``` ruby
set.arithmetic_mean  # => 3

set.geometric_mean   # => 2.6051

set.harmonic_mean   # => 2.1897
```

### Extreme values

Calculate extreme values

``` ruby
set.maximum # => 5

set.minimum # => 1
```

### Histograms

Create a histogram for the provided data

``` ruby
data_set  = Flexo::DataSet.new([1, 2, 3, 4, 5])
histogram = set.histogram :bin_size => 2

histogram.intervals  # => [1...3, 3...5, {5...7}]
histogram.counts     # => [2, 2, 1]
histogram.percentage # => [40, 40, 20]
```

``` ruby
histogram.table

   1...10 | ###
  10...19 | ###
  19...28 | ###
  28...37 | ###
  37...46 | ###
  46...55 | ###
  55...64 | ###
  64...73 | ###
  73...82 | ###
  82...91 | ###
 91...100 | ###
100...109 | ###
109...118 | ###
```

For example to measure the randomness of the ruby's `Random`:

``` ruby
random_numbers = 100.times.map{ Random.rand(100) }

set = Flexo::DataSet.new(random_numbers)
set.histogram(:range => (0..100), :bin_size => 10).table

  0...10 | #######
 10...20 | ####
 20...30 | ####
 30...40 | ####
 40...50 | ####
 50...60 | ####
 60...70 | #####
 70...80 | #######
 80...90 | ####
90...100 | ####
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/flexo/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
