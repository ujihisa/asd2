require 'mathn'

def generate_primes(num)
  Prime.new.take_while {|i| i <= num }
end
