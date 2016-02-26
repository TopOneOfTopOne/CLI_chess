module Chess
  class Game
    def initialize
      Printer.welcome_msg
      # Printer.help_reminder
      @moves = 0
      @board = Board.new
      @players = [Player.new(:white), Player.new(:black)]
      run
    end

    def run
      loop do
         @players.each do |player|
           system('clear')
           @board.display
           return if game_ended(player)
           check_scenarios(player)
           player.move_piece(@board)
           @moves += 1
         end
      end
    end

    def check_scenarios(player)
      Printer.check(player) if Scenario.check?(player.color,@board)
      Scenario.promote_pawn(player,@board) if Scenario.promote_pawn?(player.color,@board)
    end

    def game_ended(player)
      if Scenario.checkmate?(player, @board)
        "Check mate #{player.name} (#{color}) wins!"
        return true
      elsif Scenario.stalemate?(@board)
        "No possible moves stalemate!"
        return true
      elsif @moves > 100
        "Game has passed 100 moves its a stalemate!"
        return true
      else
        return false
      end
    end

    def calc_current_player
      # moves made by player0 will make @moves odd therefore if moves is odd that means the last move came from player0
      @moves%2 != 0 ? @players[0] : @players[1]
    end
  end
end

