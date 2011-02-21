# ========================================================
# = Testing                                              =
# ========================================================

$: << File.dirname(__FILE__)

require 'test.rb'
require 'test/unit'

class TryoutTesting < Test::Unit::TestCase
  def test_var_a
    assert_equal 2, RubyTesting.new(2).number, "Test variable a"
  end
end
