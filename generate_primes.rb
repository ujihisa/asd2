<<<<<<< Updated upstream:generate_primes.rb

def generate_primes(num)
  # FIXME
  [num]
=======
if RUBY_VERSION >= '1.9.0'
  require 'prime'

  def generate_primes(num)
    Prime.instance.take_while{|i| i <= num }
  end
else
  require 'mathn'

  def generate_primes(num)
    Prime.new.take_while {|i| i <= num }
  end
>>>>>>> Stashed changes:generate_primes.rb
end
