module Tennis
  class Game
    attr_accessor :player1, :player2

    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    # Increments the score of the winning player by 1. 
    def wins_ball(player) 
      player1.points += 1 if player == 1
      player2.points += 1 if player == 2  
    end
  
  end

  class Player
    attr_accessor :points, :opponent

    def initialize
      @points = 0
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
    end

    # Returns the String score for the player. **add 2,3,4
    # 
    # Returns deuce if both player and opponent have 3 points (we have access to opponent from attr_accessor). 
    # 
    # Returns advantage if both players have at least 3 points, but player has
    def score
      return 'love' if @points == 0
      return 'fifteen' if @points == 1
      return 'thirty' if @points == 2
      
      return 'deuce' if @points == 3 && @opponent.points==3
    
      return 'advantage' if (@points >= 3 && @opponent.points >= 3) && @points == (@opponent.points + 1)
      return 'win' if @points >= 3 && @points == (@opponent.points + 2)
      
      return 'forty' if @points == 3 
      
    end
  end
end