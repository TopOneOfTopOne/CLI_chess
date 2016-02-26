module Chess
  class Game

    def initialize
      # in future implement a move log to enforce a 50 move rule
      # add deselection
      # add colorize gem
      Printer.welcome_msg
      Printer.help_reminder
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
           # break if game_ended
           check_scenarios(player)
           player.move_piece(@board)
           @moves += 1
         end
         # if game_ended
         #   Printer.game_end(game_ended)
         #   break
         # end
      end
    end

    def check_scenarios(player)
      Printer.check(player) if Scenario.check?(player.color,@board)
      Scenario.promote_pawn(player,@board) if Scenario.promote_pawn?(player.color,@board)
    end

    # this method is not well written but has been done to save code lines
    # should really return a boolean
    # def game_ended
    #   player = calc_current_player
    #   if @board.check_mate?(player)
    #     "Check mate #{player.name} (#{color}) wins!"
    #   elsif @board.stalemate?(player)
    #     "No possible moves stalemate!"
    #   elsif @moves > 100
    #     "Game has passed 100 moves its a stalemate!"
    #   else
    #     nil
    #   end
    # end
    #
    # def calc_current_player
    #   # moves made by player0 will make @moves odd therefore if moves is odd that means the last move came from player0
    #   @moves%2 != 0 ? @players[0] : @players[1]
    # end

    # def check?(color)
    #   #true when a possible_move of opponents piece includes the players king piece location
    #   kill_only = true # only need locations where opponents pieces can attack
    #   king = nil
    #   @board.iterate_grid {|piece, loc| king = loc if (piece.name == 'king0' && piece.color == color)}
    #   @board.iterate_grid {|piece, _| return true if (piece.color != color && piece.possible_moves(@board,kill_only).include?(king))}
    #   false
    # end
  end
end

