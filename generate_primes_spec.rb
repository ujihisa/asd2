require 'generate_primes'

describe 'genarate_primesで素数の配列を返すとき' do
  it 'は、0までの素数は存在しないこと' do
    generate_primes(0).size.should == 0
  end

  it 'は、2までの素数として2を返すこと' do
    result = generate_primes 2
    result.size.should == 1
    result[0].should == 2
  end

  it 'は、3までの素数として2と3を返すこと' do
    result = generate_primes 3
    result.size.should == 2
    result[0].should == 2
    result[1].should == 3
  end

  it 'は、100までの素数を25個返し、25個目の素数は97であること' do
    result = generate_primes 100
    result.size.should == 25
    result.last.should == 97
  end
end
