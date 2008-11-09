require 'test/unit'

class TestGeneratePrimes < Test::Unit::TestCase
  def generate_primes(num)
    eval `runghc generate_primes.hs #{num}`
  end

  def test_primes
    null_array = generate_primes(0)
    assert_equal(0, null_array.size)
    min_array = generate_primes(2)
    assert_equal(1, min_array.size)
    assert_equal(2, min_array[0])
    three_array = generate_primes(3)
    assert_equal(2, three_array.size)
    assert_equal(2, three_array[0])
    assert_equal(3, three_array[1])
    cent_array = generate_primes(100)
    assert_equal(25, cent_array.size)
    assert_equal(97, cent_array.last)
  end
end

