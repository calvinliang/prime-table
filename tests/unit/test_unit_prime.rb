require 'test/unit'
require './lib/prime'
require 'stringio'

class PrimeUnitTest < Test::Unit::TestCase

  # Taken from http://stackoverflow.com/a/4459729
  # Captures the output from stdout and assigns it to a string
  def capture_stdout
    real_stdout, $stdout = $stdout, StringIO.new
    yield
    $stdout.string
  ensure
    $stdout = real_stdout
  end

  def test_sieve
    p = Prime.new
    assert_equal(p.sieve(5), [2, 3, 5, 7, 11])
  end

  def test_sieve_zero
    p = Prime.new
    assert_equal(p.sieve(0), [])
  end

  def test_sieve_one
    p = Prime.new
    assert_equal(p.sieve(1), [2])
  end

  def test_sieve_negative_one
    p = Prime.new
    assert_equal(p.sieve(-1), [])
  end

  def test_sieve_string
    p = Prime.new
    assert_equal(p.sieve('hello'), [])
  end

end