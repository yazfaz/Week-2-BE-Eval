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
      return love_score if love?
      return fifteen_score if fifteen?
      return thirty_score if thirty?
      return deuce_score if deuce?
      return advantage_score if advantage?
      return win_score if win?
      return forty_score if forty?
      
    end

     private 
      
      def love?
         @points == 0
      end 

      def love_score
        return 'love'
      end

      def fifteen?
        @points == 1
      end

      def fifteen_score
        return 'fifteen'
      end

      def thirty?
        @points == 2
      end

      def thirty_score
        return 'thirty'
      end


      def deuce?
        @points == 3 && @opponent.points == 3
      end

      def deuce_score
        return 'deuce'
      end

      def advantage?
        (@points >= 3 && @opponent.points >= 3) && @points == (@opponent.points + 1)
      end

      def advantage_score
        return 'advantage'
      end

      def win?
        @points >= 3 && @points == (@opponent.points + 2)
      end

      def win_score
        return 'win'
      end

      def forty?
        @points == 3 
      end

      def forty_score
        return 'forty'
      end

  end
end