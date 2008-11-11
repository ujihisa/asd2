
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
      judge
    end

    def raw_score
      @score
    end

    def inspect
      "#{@player1.name} : #{@score[@player1]}, #{@player2.name} : #{@score[@player2]}"
    end

    def add(player)
      raise @winner.inspect if winner
      @score[player] += 1
    end

    def winner
      return @winner if @winner
      result = judge
      case result
      when Player
        result
      else
        nil
      end
    end

    private

    def judge
      p1, p2 = @score[@player1], @score[@player2]
      if p1 >= 3 && p2 >= 3
        case
        when p1 == p2
          :duce
        when (p1 - p2).abs == 1
          :advantage
        when (p1 - p2).abs >= 2
          if p1 > p2
            @player1
          else
            @player2
          end
        end
      else
        case
        when p1 == 4
          @player1
        when p2 == 4
          @player2
        else
          [p1, p2]
        end
      end
    end
  end

  class Player
    def initialize(name)
      @name = name
    end
  end
end
