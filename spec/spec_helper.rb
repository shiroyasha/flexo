$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'flexo'
require 'byebug'

RSpec::Matchers.define :match_stdout do |expected_output|

  @capture = nil

  match do |block|

    begin
      stdout_saved = $stdout
      $stdout      = StringIO.new
      block.call
    ensure
      @capture     = $stdout
      $stdout      = stdout_saved
    end

    @capture.string == expected_output
  end

  failure_message do
    "expected to #{description}"
  end
  failure_message_when_negated do
    "expected not to #{description}"
  end
  description do
    "match [#{expected_output}] on stdout [#{@capture.string}]"
  end

  def supports_block_expectations?
    true
  end
end
