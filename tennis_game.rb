
module TennisGame
  class Match
    def initialize(player1, player2, max_set_count)
      @player1 = player1
      @player2 = player2
      @max_set_count = max_set_count
    end
  end

  class Game
    
    
    
    def initialize(player1, player2)
      @player1 = player1
      @player2 = player2
      @score = {
        @player1 => 0,
        @player2 => 0
      }
    end
    # human readable
    def score
      calculate_score(@score[@player1], @score[@player2])
    end

    def raw_score
      @score
    end

    def inspect
      "#{@player1.name} : #{@score[@player1]}, #{@player2.name} : #{@score[@player2]}"
    end

    def add(player)
      @score[player] += 1
    end

    def winner
      case
      when @score[@player1] == @score[@player2]
        nil
      when @score[@player1] >= 4
        @player1
      when @score[@player2] >= 4
        @player2
      else
        nil
      end
    end

    private
    
    def calculate_score(point1, point2)
      case
      when point1 >= 4 && point2 >= 4 && point1 == point2
        :duce
      when point1 >= 4 && point2 >= 4 && point1 > point2
        :advantage
      when point1 >= 4 && point2 >= 4 && point1 < point2
        :advantage
      else
        [point1, point2]
      end
    end
  end

  class Player
    def initialize(name)
      @name = name
    end
  end
end
