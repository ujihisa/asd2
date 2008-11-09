# author: cuzic
class Game
  def initialize
    @throws = [10,10,10,8,10,10]
  end

  def calculate_score
    score = 0
    @throws.each do |i|
      score += i
    end
    return score
  end

  def calculate_frame
    num = 0
    hajime = true
    @throws.each do |i|
      if hajime and i == 10 then
        num += 1
      elsif hajime then
        hajime = false
      else
        hajime = true
        num += 1
      end
    end
    return num
  end
  
  def test_frame
    if calculate_frame == 1 then
      $stderr.puts "OK"
    else
      $stderr.puts "NG"
    end
  end

  def test_score
    if calculate_score == 10 then
      $stderr.puts "OK"
    else
      $stderr.puts "NG"
    end
  end
end

game = Game.new
puts game.calculate_frame
